# batcon
A lightweight toggle script for Lenovo IdeaPad battery conservation mode on Linux.

## What it does
Most Lenovo laptops have a hardware-level "Conservation Mode" that limits the battery charge to 60% to prolong battery lifespan when plugged in. 

This script allows you to toggle that mode directly from your terminal.

## Installation
1. Clone the repo:
   ```bash
   git clone https://github.com/jerryyy9/batcon.git
   cd batcon
    ```
2. Run the installer:
    ```bash
    chmod +x install.sh
    ./install.sh
    ```
## Usage
Type the command in the terminal:
    ```
    batcon
    ```

## Why is my battery not charging"?
Don't panic! When Conservation Mode is active, the laptop runs directly off AC power once it reaches 60%. This prevents the "micro-cycles" of charging that degrade battery health.
