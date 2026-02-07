# Hytale Server Auto-Launcher

A robust, cross-platform bootstrapper for hosting a Hytale Dedicated Server. This script handles downloading the official tools, updating game files, and launching the server automatically.

It works on both **Windows** and **Linux**.

## Features
*   **Automatic Setup:** Downloads the Hytale Downloader Tool and Game Server files automatically on first run.
*   **Smart Updates:** Checks for updates to the Downloader Tool every time you start.
*   **Self-Updating:** The script checks this Git repository for updates to itself and restarts automatically if a new version is found.
*   **Cross-Platform:** Runs on Windows (via `.bat`) and Linux (via `.sh` and PowerShell Core).

## Prerequisites

Before running the scripts, ensure you have the following installed:

1.  **Java:** The Hytale Server requires Java to run.
2.  **Git:** Required for the script to auto-update itself.
3.  **PowerShell:**
    *   **Windows:** Installed by default.
    *   **Linux:** You must install PowerShell (`pwsh`). [Installation Guide](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-linux)
4. **Screen:**
   **a terminal multiplexer that allows you to run your server in a "virtual window". This ensures the process keeps running in the background even if you close your terminal or lose your SSH connection.
   Installation:
   Debian/Ubuntu: sudo apt install screen
   CentOS/RHEL: sudo yum install screen**

## Installation

Do not download this as a ZIP. **You must clone the repository** for the auto-update feature to work.

```bash
git clone https://github.com/Aduxx06/hytale-server-setup.git
cd hytale-server-setup
```

## Usage

### 🪟 Windows

1. Start Server: Double-click start.bat.
This will check for tool updates, then launch the server. It will not force-check the game server version to save time.

2. Force Update: Double-click update.bat.
Use this if you know a game update is out. It forces a validation of all server files.

Optional Parameters:
Override RAM and port via command line:
.\start.ps1 -ServerPort 7777 -MinRAM 4G -MaxRAM 8G

### 🐧 Linux

First, ensure the scripts are executable:
```bash
chmod +x start.sh update.sh backup.sh
```

1.  **Start Server:** Run `./start.sh`
2.  **Force Update:** Run `./update.sh`
3.  **Optional Parameters:
Override RAM and port: pwsh ./start.ps1 -ServerPort 7777 -MinRAM 4G -MaxRAM 8G

Configuration (RAM & Port)

Default values:

Port: 5050

RAM: 2G → 4G

Using environment variables (recommended for systemd)

Environment=HYTALE_PORT=5520
Environment=HYTALE_MIN_RAM=4G
Environment=HYTALE_MAX_RAM=8G

Systemd Service (Linux)

Copy the service file:

sudo cp systemd/hytale.service /etc/systemd/system/hytale.service
sudo systemctl daemon-reload
sudo systemctl enable hytale
sudo systemctl start hytale


Attach to console:

screen -r hytale

Backups
Manual backup
chmod +x backup.sh
sudo backup.sh

Automatic backup (cron example)
0 3 * * * /opt/hytale-server/scripts/backup.sh >> /opt/hytale-server/scripts/backup.log 2>&1

Notes

Make sure the paths in systemd/crontab match your installation.

Windows users can rely on .bat wrappers.

Linux users can use .sh wrappers, systemd, or cron for automation.

Always check logs (backup.log or console output) to verify backup/update success.
