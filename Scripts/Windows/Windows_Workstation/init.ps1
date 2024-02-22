# This script is used when first installing windows. This will install all programs and packages needed for
# development.
#
# Install Chocolatey (if not already installed)
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}
#
# Install packages
$packages = @(
    # Administrative Tools
    "chocolatey-core.extension",    # Chocolatey core extensions
    "jq",                           # JSON query tool
    "7zip",                         # Unzip tool
    "powertoys",                    # Enhanced Windows functionality
    "git",                          # Version control
    "gh",                           # Git CLI
    "vscode",                       # Code editor
    "osquery",                      # SQL based query tool
    "winfetch",                     # CLI-sysinfo
    # Development Tools
    "nodejs-lts",                   # For web development
    "googlechrome",                 # Web testing browser
    "yarn",                         # Node.JS package manager
    # Programming Languages
    "python",                       # Python
    "ruby",                         # Ruby on Rails
    "golang",                       # GoLang
    "openjdk",                      # Java Development
    "dotnet-sdk",                   # .Net Development
    # Development Environment
    "docker-desktop",               # Docker Management
    "podman-desktop",               # Kubernetes Management
    "awscli",                       # AWS Management
    "azure-cli",                    # Azure Management
    "terraform",                    # Cloud Configuration Tool
    "gcloudsdk",                    # Google Cloud Platform Management
    # Game Launchers
    "epicgameslauncher",            # Epic Games Launcher
    "rockstargameslauncher",        # Rockstar Games Launcher
    "amazongames",                  # Amazon Games Client
    "steam",                        # Steam
    "ea-app",                       # EA App
    "final-fantasy-xiv",            # Final Fantasy 14 Online
    "valorant",                     # Riot Client
    "playnite",                     # Playnite Frontend
    # Streaming Software
    "streamlabs-obs",
    # Windows Features
    "Microsoft-Windows-Subsystem-Linux /y /source windowsfeatures",
    "VirtualMachinePlatform /y /source windowsfeatures",
    "Containers-DisposableClientVM /y /source windowsfeatures",
    "IIS-WebServerRole /y /source windowsfeatures",
    "IIS-WebServer /y /source windowsfeatures",
    "IIS-CommonHttpFeatures /y /source windowsfeatures",
    "IIS-ApplicationDevelopment /y /source windowsfeatures",
    "IIS-Security /y /source windowsfeatures",
    "IIS-HealthAndDiagnostics /y /source windowsfeatures",
    "IIS-Performance /y /source windowsfeatures",
    "IIS-WebServerManagementTools /y /source windowsfeatures"
    # Add more packages here as needed
)
foreach ($package in $packages) {
    choco install -y $package
}
Write-Output "Packages installed successfully!"
#
# Install Windows Store Apps via winget
Write-Host "Installing Windows Store Apps silently..."
# Install Windows Store Apps
$wingetCommands = @(
    { winget install --id=GOG.Galaxy -e --silent },
    { winget install --id=Ubisoft.Connect -e --silent },
    { winget install --id=AppleInc.iCloud_nzyj5cx40ttqa -e --silent },
    { winget install --id=AppleInc.AppleTVWin_nzyj5cx40ttqa -e --silent },
    { winget install --id=AppleInc.AppleMusicWin_nzyj5cx40ttqa -e --silent },
    { winget install --id=AppleInc.AppleDevices_nzyj5cx40ttqa -e --silent },
    { winget install --id=Battle.net -e --silent },
    { winget install --id=Streamlabs.Streamlabs -e --silent },
    { winget install --id=Discord.Discord -e --silent },
    { winget install --id=BlenderFoundation.Blender -e --silent },
    { winget install --id=Ultimaker.Cura -e --silent },
    { winget install --id=RazerInc.RazerInstaller -e --silent },
    { winget install --id=9PK9W5QV2PKX -e --silent },
    { winget install --id=Microsoft.Powershell -e --silent }
)
# Execute each winget command
foreach ($command in $wingetCommands) {
    Write-Host "Executing $command..."
    & $command
    Write-Host "Windows Store applications installed successfully!"
}
#
# Download and Install EmuDeck
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/EmuDeck/emudeck-we/main/install.ps1'))
#
# Install Greenlight Xbox Series Streaming App
Invoke-WebRequest -Uri "https://github.com/unknownskl/greenlight/releases/download/v2.1.1/Greenlight-Setup-2.1.1.exe" -OutFile "C:\Temp\Greenlight-Setup-2.1.1.exe"
Add-AppxPackage -Path "C:\Temp\Greenlight-Setup-2.1.1.exe"
#
# Install Chiaki Playstation Streaming App
Invoke-WebRequest -Uri "https://git.sr.ht/~thestr4ng3r/chiaki/refs/download/v2.1.1/Chiaki-v2.1.1-Windows-x86_64.zip" -OutFile "C:\Temp\Chiaki-v2.1.1-Windows-x86_64.zip"
Expand-Archive -Path "C:\Temp\Chiaki-v2.1.1-Windows-x86_64.zip" -DestinationPath "C:\Program Files\Chiaki\"
#
# Install and setup Angular workspace
npm install -g @angular/cli
ng new WebTest
cd ./WebTest
ng serve
Start-Process "http://localhost:4200/"
#
# Install AWS Tools for Powershell
Install-Module -Name AWS.Tools.Installer
# Install all AWS Modules
./install-awstools.ps1
#
# Install VMware CLI and PowerCLI
Install-Module VMware.PowerCLI -Scope CurrentUser

Write-Host "Installation completed. Please review output for errors."