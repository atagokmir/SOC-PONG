# SOC-PONG

A two-player Pong game implemented entirely in **ARM Assembly** for the **DE1-SoC FPGA development board**.

<p align="center">
  <img src="https://www.terasic.com.tw/attachment/archive/836/image/image_72_thumb.jpg" alt="DE1-SoC Board" width="600"/>
</p>

---

## Overview

SOC-PONG runs on the ARM Cortex-A9 processor of the DE1-SoC board. The game renders to the VGA display using a double-buffered pixel buffer, reads player input from the onboard pushbutton keys, and uses the A9 private timer interrupt to drive the game loop at 60 FPS. Scores are shown on both the VGA screen and the seven-segment HEX displays.

---

## Hardware

| Component | Usage |
|---|---|
| ARM Cortex-A9 | Main processor |
| A9 Private Timer | 60 FPS game loop (IRQ 29) |
| Pushbutton Keys (KEY0–3) | Player input (IRQ 73) |
| VGA Display (320×240) | Game rendering via pixel buffer |
| HEX Displays (HEX0, HEX3) | Live score display |
| SDRAM | Back buffer storage |
| Character Buffer | Title / win screen text |

---

## Controls

| Key | Action |
|---|---|
| KEY0 | Player 1 — Move Up |
| KEY1 | Player 1 — Move Down |
| KEY2 | Player 2 — Move Up |
| KEY3 | Player 2 — Move Down |
| Any key (Title Screen) | Start game |
| Any key (Win Screen) | Return to title |

---

## Game Rules

- First player to score **10 points** wins.
- The ball bounces off the top and bottom walls.
- Missing the ball gives the opponent a point and resets the ball to center.
- After a score the ball reverses X direction, keeping Y velocity unchanged.

---

## Project Structure

```
src/
├── config/
│   ├── config_exceptions.s      # IRQ / exception vector table
│   ├── config_interrupts.s      # GIC setup (enable, configure, disable)
│   ├── config_keys.s            # Pushbutton parallel port configuration
│   ├── config_pixel_buf_ctrl.s  # Pixel buffer controller initialization
│   └── config_timer.s           # A9 private timer configuration
│
├── constants/
│   ├── address_map_arm.s        # Memory-mapped peripheral addresses
│   ├── defines.s                # Game constants (screen size, speeds, states)
│   └── interrupt_ids.s          # IRQ IDs for timer and keys
│
├── game/
│   ├── ball_movement.s          # MOVE_BALL — updates ball position each frame
│   ├── collision_detection.s    # Wall / paddle collision, scoring triggers
│   ├── paddle_movement.s        # MOVE_PADDLES / MOVE_PLAYER with boundary checks
│   └── scoring.s                # UPDATE_SCORES, END_GAME, RESET_GAME
│
├── isr/
│   ├── timer_isr.s              # Timer ISR — drives game logic at 60 FPS
│   └── key_isr.s                # Key ISR — handles game state transitions
│
├── rendering/
│   ├── buffer.s                 # CLEAR_SCREEN, SWAP_BUFFERS (double buffering)
│   ├── draw_game.s              # DRAW_BALL, DRAW_PADDLE
│   ├── draw_on_hex.s            # DRAW_ON_HEX — seven-segment score display
│   └── draw_ui.s                # DRAW_TITLE, DRAW_WIN (character buffer text)
│
├── global_variables.s           # All shared game state variables (.data section)
└── main.s                       # Entry point and main game loop
```

---

## Architecture

### Game Loop (60 FPS, timer-driven)

```
Timer IRQ fires
    └── TIMER_ISR
            ├── MOVE_PADDLES   (read keys, update p1_y / p2_y)
            ├── MOVE_BALL      (update ball_x / ball_y)
            └── CHECK_COLLISIONS
                    ├── CHECK_WALL_COLLISIONS   → REVERSE_Y_VELOCITY
                    ├── CHECK_PADDLE_COLLISIONS → REVERSE_X_VELOCITY
                    └── CHECK_SCORE → UPDATE_SCORES / END_GAME / RESET_BALL
```

### State Machine (key-driven)

```
TITLE ──(any key)──► PLAYING ──(score = 10)──► WIN ──(any key)──► TITLE
```

### Double Buffering

Every frame:
1. Draw to **back buffer** (SDRAM)
2. Call `SWAP_BUFFERS` — writes 1 to PBC, waits for vsync, reads new back buffer address

---

## Constants

| Constant | Value | Description |
|---|---|---|
| `SCREEN_WIDTH` | 320 | VGA horizontal resolution |
| `SCREEN_HEIGHT` | 240 | VGA vertical resolution |
| `BALL_SIZE` | 4 | Ball width and height (pixels) |
| `PADDLE_WIDTH` | 5 | Paddle width (pixels) |
| `PADDLE_HEIGHT` | 30 | Paddle height (pixels) |
| `PADDLE_SPEED` | 2 | Pixels per frame |
| `WINNING_SCORE` | 10 | Score required to win |
| `TIMER_LOAD_60_FPS` | 3,333,333 | A9 timer load value (200 MHz / 60) |

---

## Authors

- **Ata Gökmir Çetinel** — [cetinela@mef.edu.tr](mailto:cetinela@mef.edu.tr)

---

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
