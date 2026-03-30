# batcon
A lightweight toggle script for Lenovo IdeaPad battery conservation mode on Linux.

## What it does
Most Lenovo laptops have a hardware-level "Conservation Mode" that limits the battery charge to 60% to prolong battery lifespan when plugged in. 

This script allows you to toggle that mode directly from your terminal.

## Quick Install
Paste this curl command in your terminal:
```bash
curl -sSL https://raw.githubusercontent.com/jerryyy9/batcon/main/install.sh | bash
```
    
## Manual Installation

### 1. Clone the repo:
```bash
git clone https://github.com/jerryyy9/batcon.git
cd batcon
```
### 2. Run the installer:
```bash
chmod +x install.sh
./install.sh
```
## Usage
Type the command in the terminal:
```
batcon
```

## Optional: KDE Plasma Integration

### 1. Application Launcher & Taskbar
If you opted into the Plasma integration during installation, you can:
* Find **Toggle Battery Conservation** in your Application Launcher (Start Menu).
* Right-click it to **Pin to Task Manager** for one-click toggling.

### 2. Live Status Indicator (Taskbar Widget)
To see if Conservation Mode is ON or OFF at all times on your panel:
1. Right-click your Taskbar Panel > **Add Widgets**.
2. Click get new and search for **Command Output** by **Zren** and drag it onto your panel.
3. Right-click the widget > **Configure**.
4. Set **Command** to:
```bash
cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode | sed 's/1/BAT: ON/;s/0/BAT: OFF/'
```
5. Under acitons you can set ```sudo batcon``` as a command on click for a quick toggle direcly from the taskbar.

## Uninstallation
Make sure to disable Conservation Mode before uninstallation, if you want to charge your battery to 100%. Then just run:
```bash
sudo rm /usr/local/bin/batcon
```
