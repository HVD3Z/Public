# Linux
If ($IsLinux -eq $true) {
    Write-Host "The host is Linux based..." -ForegroundColor Cyan -NoNewline
    Write-Host "Gathering host configuration information..." -ForegroundColor Cyan -NoNewline
    hostnamectl | Tee-Object ~/systeminfo.txt
}

# MacOS
If ($IsMacOS -eq $true) {
    Write-Host "The host is macOS based..." -ForegroundColor Cyan -NoNewline
    Write-Host "Gathering host configuration information..." -ForegroundColor Cyan -NoNewline
    sysctl -a -h | Tee-Object ~/systeminfo.txt
}

# Windows (PowerShell 5 does not support $IsWindows, so check for $env:OS instead)
If ($env:OS -eq "Windows_NT") {
    Write-Host "The host is Windows based..." -ForegroundColor Cyan -NoNewline
    Write-Host "Gathering host configuration information..." -ForegroundColor Cyan -NoNewline
    systeminfo | Tee-Object $HOME\systeminfo.txt
}
