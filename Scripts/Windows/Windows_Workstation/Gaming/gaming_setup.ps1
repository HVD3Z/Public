# Gaming Workstation Setup Script, #

# Check if PowerShell is Admin mode. Switch to it if not
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

# Check if Chocolatey is already installed
$chocoInstalled = Get-Command choco -ErrorAction SilentlyContinue
if ($chocoInstalled) {
    Write-Host "Chocolatey is already installed. Continuing with the script..."
} else {
    # Install Chocolatey (Package Manager for Windows)
    Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    Write-Host "Chocolatey has been installed. Continuing with the script..." -ForegroundColor Cyan -NoNewline
}
Start-Sleep -s 5

Write-Host "Installing Windows Store applications..." -ForegroundColor Cyan -NoNewline
# Install Windows Store Apps, uses app ID which is found in the hyperlink of the windows store application page.
$appIds = @(
    "9PKTQ5699M62",                 # iCloud
    "9NM4T8B9JQZ1",                 # Apple TV
    "9PFHDD62MXS1",                 # Apple Music
    "9NP83LWLPZ9K",                 # Apple Devices
    "XPDC2RH70K22MN",               # Discord
    "9MZ1SNWT0N5D",                 # Powershell 7
    "XPDP2QW12DFSFK",               # Ubisoft Connect
    "XP99VR1BPSBQJ2"                # Epic Games
    )
foreach ($appId in $appIds) {
    winget install --id=$appId -e --silent
}
Write-Host "Windows Store applications completed successfully! Moving onto chocolatey packages..." -ForegroundColor Cyan -NoNewline
Start-Sleep -s 5

# Install Chocolatey packages that are not in Windows Store.
Write-Host "Installing Chocolatey packages..." -ForegroundColor Cyan -NoNewline
$packages =@(
    "7zip",                         # A popular open-source file archiver utility for compressing and extracting files.
    "googlechrome",                 # Google Chrome web browser.
    "streamlabs-obs",               # Streamlabs OBS, a broadcasting and streaming software for content creators.
    "handbrake",                    # HandBrake for video compression
    "vlc",                          # VLC Media Player for media playback
    "greenshot",                    # Greenshot for taking screenshots
    "epicgameslauncher",            # Epic Games Launcher
    "rockstargameslauncher",        # Rockstar Games Launcher
    "amazongames",                  # Amazon Games Client
    "steam",                        # Steam
    "ea-app",                       # EA App
    "final-fantasy-xiv",            # Final Fantasy 14 Online
    "valorant",                     # Riot Client
    "playnite"                      # Playnite Frontend
)
foreach ($package in $packages) {
    choco install -y $package
}
Write-Host "Chocolatey package installation completed successfully! Now installing Emudeck..." -ForegroundColor Cyan -NoNewline
Start-Sleep -s 5

# Download and Install EmuDeck
Write-Host "Installing EmuDeck..."
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/EmuDeck/emudeck-we/main/install.ps1'))
Write-Host "EmuDeck installation completed successfully!"
Start-Sleep -s 5

# Install Chiaki PlayStation Streaming App
Write-Host "Installing Chiaki..."
Invoke-WebRequest -Uri "https://git.sr.ht/~thestr4ng3r/chiaki/refs/download/v2.2.0/Chiaki-v2.2.0-Windows-x86_64.zip" -OutFile "C:\Temp\Chiaki-v2.2.0-Windows-x86_64.zip"
Expand-Archive -Path "C:\Temp\Chiaki-v2.2.0-Windows-x86_64.zip" -DestinationPath "C:\Program Files (x86)\Chiaki\"
Remove-Item "C:\Temp\Chiaki-v2.2.0-Windows-x86_64.zip"
Write-Host "Chiaki installation completed successfully!"
Start-Sleep -s 5