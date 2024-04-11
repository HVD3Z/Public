# Web Development Workstation Setup Script

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

# Install Azure Powershell modules
Write-Host "Installing Azure Powershell module..." -ForegroundColor Cyan -NoNewline
Install-Module -Name Az -Repository PSGallery -Force
# Install AWS Tools for PowerShell
Write-Host "Installing AWS Tools for PowerShell..." -ForegroundColor Cyan -NoNewline
Install-Module -Name AWS.Tools.Installer
# Install all AWS modules
Invoke-Expression -Command .\install-awstools.ps1
Write-Host "AWS tools installed... Now installing PowerCLI..." -ForegroundColor Cyan -NoNewline

Start-Sleep -s 5

# Install VMware PowerCLI
Write-Host "Installing PowerCLI..." -ForegroundColor Cyan -NoNewline
Install-Module VMware.PowerCLI -Scope CurrentUser
Write-Host "PowerCLI is now installed... Moving onto installing Powershell Tools for Google Cloud..." -ForegroundColor Cyan -NoNewline

Start-Sleep -s 5

# Install Powershell Tools for Google Cloud
Write-Host "Installing Powershell Tools for Google Cloud..." -ForegroundColor Cyan -NoNewline
Install-Module GoogleCloud
gcloud init
Write-Host "Powershell Tools for Google Cloud is now installed... Moving onto installing Windows Store Apps..." -ForegroundColor Cyan -NoNewline

Start-Sleep -s 5

Write-Host "Installing Windows Store applications..." -ForegroundColor Cyan -NoNewline
# Install Windows Store Apps
$appIds = @(
    "9PKTQ5699M62",   # iCloud
    "9PFHDD62MXS1",   # Apple Music
    "9NP83LWLPZ9K",   # Apple Devices
    "XPDC2RH70K22MN", # Discord
    "9MZ1SNWT0N5D"    # Powershell 7
)
foreach ($appId in $appIds) {
    winget install --id=$appId -e --silent
}
Write-Host "Windows Store applications installed... Moving onto chocolatey packages..." -ForegroundColor Cyan -NoNewline

Start-Sleep -s 5

Write-Host "Installing Chocolatey packages..." -ForegroundColor Cyan -NoNewline
$packages =@(
    "chocolatey-core.extension",    # An extension for Chocolatey, a package manager for Windows, providing additional functionality.
    "jq",                           # A lightweight and flexible command-line JSON processor.
    "7zip",                         # A popular open-source file archiver utility for compressing and extracting files.
    "git",                          # A distributed version control system for tracking changes in source code during software development.
    "gh",                           # CLI for GitHub
    "vscode",                       # Visual Studio Code, a powerful and extensible code editor.
    "osquery",                      # A tool for querying and monitoring your operating system as if it were a relational database.
    "winfetch",                     # A command-line system information tool for Windows, similar to "neofetch" on Linux.
    "python",                       # The Python programming language interpreter.
    "podman-desktop",               # Podman Desktop, an alternative container runtime for managing containers.
    "awscli",                       # The AWS Command Line Interface for interacting with Amazon Web Services.
    "azure-cli",                    # The Azure Command-Line Interface for managing Azure resources.
    "terraform",                    # A tool for provisioning and managing infrastructure as code (IaC).
    "nodejs-lts",                   # Node.js, a JavaScript runtime for building server-side applications.
    "yarn",                         # A package manager for JavaScript projects, compatible with npm.
    "googlechrome",                 # Google Chrome web browser.
    "firefox",                      # Mozilla Firefox web browser.
    "sql-server-management-studio", # Microsoft SQL Server Management Studio for managing SQL databases.
    "mysql.workbench",              # MySQL Workbench, a visual tool for MySQL database development.
    "github-desktop",               # GitHub Desktop, a graphical user interface for Git repositories.
    "streamlabs-obs"                # Streamlabs OBS, a broadcasting and recording software for content creators.
)
foreach ($package in $packages) {
    choco install -y $package
}
Write-Host "Packages have been installed... Now installing features..." -ForegroundColor Cyan -NoNewline

Start-Sleep -s 5

Write-Host "Installing Windows features..." -ForegroundColor Cyan -NoNewline
$features = @(
# Install Windows Features
    "Microsoft-Windows-Subsystem-Linux /y /source windowsfeatures",
    "VirtualMachinePlatform /y /source windowsfeatures",
    "Containers-DisposableClientVM /y /source windowsfeatures"
)
foreach ($feature in $features) {
    choco install -y $feature
}
Write-Host "Features have been installed... Moving onto building configurations..." -ForegroundColor Cyan -NoNewline

Start-Sleep -s 10

# Configure Git
$name = Read-Host -Prompt "Enter your name"
$email = Read-Host -Prompt "Enter your email address"
git config --global user.name "$name"
git config --global user.email "$email"
gh auth login

# Set up Angular workspace
Write-Host "Setting up Angular Workspace..." -ForegroundColor Cyan -NoNewline
# Install Angular CLI globally
npm install -g @angular/cli
Write-Host "Angular installed successfully..." -ForegroundColor Cyan -NoNewline

# Set up SSH keys for Git
ssh-keygen -t ed25519 -C "$email"
gh ssh-key add $env:HOME\.ssh\id_ed25519 -t "SSH-KEY"

# Set up environment variables (e.g., PATH)
# Add paths for Node.js, Git, and other tools to the system PATH

# Additional configurations:

# Install extensions in Visual Studio Code (e.g., Live Server, ESLint)

# Note: Customize this script by adding or removing packages, features or configurations as needed.
Write-Host "Web development workstation setup completed. Restarting computer now." -ForegroundColor Cyan -NoNewline
shutdown /r now