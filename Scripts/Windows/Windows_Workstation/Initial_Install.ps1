# Description: List of Chocolatey packages for installation
$chocolateyAppList = @"
googlechrome,firefox,redis-64,dotnetcore-sdk,dotnetcore-windowshosting,jq,
7zip,powertoys,git,gh,vscode,osquery,winfetch,nodejs-lts,yarn,python,ruby,
golang,openjdk,dotnet-sdk,docker-desktop,podman-desktop,awscli,azure-cli,
terraform,gcloudsdk,epicgameslauncher,rockstargameslauncher,amazongames,
steam,ea-app,final-fantasy-xiv,valorant,playnite,streamlabs-obs,pdk
"@
# Description: List of Windows features for DISM installation
$dismAppList = @"
IIS-ASPNET45,IIS-CertProvider,IIS-ManagementService,VirtualMachinePlatform,Microsoft-Windows-Subsystem-Linux,
Containers-DisposableClientVM,IIS-WebServerRole,IIS-WebServer,IIS-CommonHttpFeatures,
IIS-HttpErrors,IIS-ApplicationDevelopment,IIS-Security,IIS-RequestFiltering,IIS-HealthAndDiagnostics,
IIS-HttpLogging,IIS-Performance,IIS-WebServerManagementTools,IIS-StaticContent,IIS-DefaultDocument,
IIS-DirectoryBrowsing,IIS-HttpCompressionStatic,IIS-ManagementConsole
"@
# Description: Install Windows applications using Chocolatey and DISM
Write-Host "Starting Initial Windows application installations..."
# Execute the installation script
Invoke-Expression "InstallApps.ps1 ""$chocolateyAppList"" ""$dismAppList"""
Write-Host "Windows applications installed successfully!" 
# Description: Install Windows Store applications using winget
# List of application IDs
$appIds = @(
    "GOG.Galaxy",
    "Ubisoft.Connect",
    "AppleInc.iCloud_nzyj5cx40ttqa",
    "AppleInc.AppleTVWin_nzyj5cx40ttqa",
    "AppleInc.AppleMusicWin_nzyj5cx40ttqa",
    "AppleInc.AppleDevices_nzyj5cx40ttqa",
    "Battle.net",
    "Streamlabs.Streamlabs",
    "Discord.Discord",
    "BlenderFoundation.Blender",
    "Ultimaker.Cura",
    "RazerInc.RazerInstaller",
    "9PK9W5QV2PKX",
    "Microsoft.Powershell"
)
# Install each application
foreach ($appId in $appIds) {
    Write-Host "Installing $appId..."
    winget install --id=$appId -e --silent
}
Write-Host "Windows Store applications installed successfully!"
# Description: Install EmuDeck for Steam Deck
Write-Host "Installing EmuDeck..."
# Download and execute the installation script
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/EmuDeck/emudeck-we/main/install.ps1'))
Write-Host "EmuDeck installation completed successfully!"
# Description: Install Greenlight Xbox Series Streaming App
Write-Host "Installing Greenlight..."
# Download the Greenlight installer
Invoke-WebRequest -Uri "https://github.com/unknownskl/greenlight/releases/download/v2.1.1/Greenlight-Setup-2.1.1.exe" -OutFile "C:\Temp\Greenlight-Setup-2.1.1.exe"
# Install the app package
Add-AppxPackage -Path "C:\Temp\Greenlight-Setup-2.1.1.exe"
Write-Host "Greenlight installation completed successfully!"
# Description: Install Chiaki PlayStation Streaming App
Write-Host "Installing Chiaki..."
# Download the Chiaki zip file
Invoke-WebRequest -Uri "https://git.sr.ht/~thestr4ng3r/chiaki/refs/download/v2.1.1/Chiaki-v2.1.1-Windows-x86_64.zip" -OutFile "C:\Temp\Chiaki-v2.1.1-Windows-x86_64.zip"
# Extract the contents to the installation directory
Expand-Archive -Path "C:\Temp\Chiaki-v2.1.1-Windows-x86_64.zip" -DestinationPath "C:\Program Files (x86)\Chiaki\"
Write-Host "Chiaki installation completed successfully!"
# Description: Install and set up Angular workspace
Write-Host "Setting up Angular Workspace..."
# Install Angular CLI globally
npm install -g @angular/cli
# Create a new Angular project named "WebTest"
ng new WebTest
# Navigate to the project directory
cd .\WebTest
# Start the development server
ng serve
# Open the project in the default web browser
Start-Process "http://localhost:4200/"
# Display the current location (optional)
Get-Location
Write-Host "Angular workspace setup completed successfully!"
# Description: Install AWS Tools for PowerShell
Write-Host "Installing AWS Tools for PowerShell..."
Install-Module -Name AWS.Tools.Installer
# Install all AWS modules
Invoke-Expression -Command .\install-awstools.ps1
# Install VMware CLI and PowerCLI
Write-Host "Installing PowerCLI..."
Install-Module VMware.PowerCLI -Scope CurrentUser
Write-Host "Script has completed. Please review the output for any errors."