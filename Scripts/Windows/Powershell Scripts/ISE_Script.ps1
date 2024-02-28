# This script will pull all requested control information from a Cisco ISE server
# Set the path to the folder containing the Cisco config text files
#$FolderPath = "C:\Path\To\Config\Files"
$FolderPath = "C:\Path\To\Config\Files"

# Set the search strings
$version = 'version ##.#'
$banner = 'banner login((.|\n)*)PRIVATE SYSTEM - RESTRICTED TO AUTHORIZED PERSONNEL((.|\n)*)THIS IS A PRIVATE COMPUTER SYSTEM. It is for authorized use only.((.|\n)*)Users \(authorized or unauthorized\) have no explicit or implicit((.|\n)*)expectation of privacy.((.|\n)*)Any or all uses of this system and all files on this system may((.|\n)*)be intercepted, monitored, recorded, copied, audited, inspected,((.|\n)*)and disclosed to authorized site and law enforcement personnel,((.|\n)*)as well as authorized officials of other agencies, both domestic((.|\n)*)and foreign.  By using this system, the user consents to such((.|\n)*)interception, monitoring, recording, copying, auditing, inspection,((.|\n)*)and disclosure at the discretion of authorized site personnel.((.|\n)*)Unauthorized or improper use of this system may result in((.|\n)*)administrative disciplinary action and civil and criminal penalties.((.|\n)*)By continuing to use this system you indicate your awareness of and((.|\n)*)consent to these terms and conditions of use.   LOG OFF IMMEDIATELY((.|\n)*)if you do not agree to the conditions stated in this warning.((.|\n)*)PRIVATE SYSTEM - RESTRICTED TO AUTHORIZED PERSONNEL'
$consoleTimeout = 'line con 0\n exec-timeout 5 0'
$vtyTimeout = 'line vty 0 4\n access-class 182 in\n exec-timeout 5 0((.|\n)*)line vty 5 15\n access-class 182 in\n exec-timeout 5 0'
$aaaGroupServerTacacs = 'aaa group server tacacs\+ TACACS\n server name TACACS\n server name TACACS'
$aztacacsServers = 'tacacs server TACACS\n address ipv4 0.0.0.0\n key 6'
$txTacacsServers = 'tacacs server TACACS\n address ipv4 0.0.0.0\n key 6'
$aaaAuthenticationLogin = 'aaa authentication login TACACS group TACACS local'
$aaaAuthorization = 'aaa authorization config-commands\naaa authorization exec default local \naaa authorization exec TACACS group TACACS if-authenticated \naaa authorization commands 7 TACACS group TACACS if-authenticated \naaa authorization commands 15 TACACS group TACACS if-authenticated'
$aaaAccounting = 'aaa accounting exec TACACS\n action-type stop-only\n group TACACS'
$conLineConfig = 'line con 0\n exec-timeout \d \d\n login authentication TACACS'
$vtyLineConfig = 'line vty 0 4\n access-class 182 in\n exec-timeout \d \d\n privilege level 15\n authorization commands 7 TACACS\n authorization exec TACACS\n accounting commands 7 TACACS\n accounting commands 15 TACACS\n login authentication TACACS\n length 0\n transport input ssh\nline vty 5 15\n access-class 182 in\n exec-timeout \d \d\n privilege level 15\n authorization commands 7 TACACS\n authorization exec TACACS\n accounting commands 7 TACACS\n accounting commands 15 TACACS\n login authentication TACACS\n length 0\n transport input ssh'
$usernameNlets = 'username user'
$loggingHosts = 'logging host 0.0.0.0\nlogging host 0.0.0.0'
$passwordEncryption = 'password encryption aes'
$vpnPhase1Encryption = 'crypto ikev2 proposal IKE2-PROPOSAL \n encryption aes-cbc-256\n integrity sha512\n group 21\n\!\ncrypto ikev2 policy POLICY1 \n proposal IKE2-PROPOSAL'
$dmvpnPhase2Encryption = 'crypto ipsec transform-set FQDN esp-aes 256 esp-sha512-hmac \n mode tunnel'
$backupPhase2Encryption = 'crypto ipsec transform-set [A-Z]+-?[A-Z]+ esp-aes 256 esp-sha-hmac \n mode transport'

#Builds Hash Table to assign readible names to the different search values, these values are the ones that should be standard across all configs
$SearchStrings = @{
Version = $version
Banner = $banner 
ConsoleTimeout = $consoleTimeout
vtyTimeout = $vtyTimeout
aaaGroupServerTacacs = $aaaGroupServerTacacs
azTacacsServers = $azTacacsServers
txTacacsServers = $txTacacsServers
aaaAuthenticationLogin = $aaaAuthenticationLogin
aaaAuthorization = $aaaAuthorization
aaaAccounting = $aaaAccounting
conLineConfig = $conLineConfig
vtyLineConfig = $vtyLineConfig
usernameNlets = $usernameNlets
loggingHosts = $loggingHosts
passwordEncryption = $passwordEncryption
vpnPhase1Encryption = $vpnPhase1Encryption
dmvpnPhase2Encryption = $dmvpnPhase2Encryption
backupPhase2Encryption = $backupPhase2Encryption
}

# Initialize variables for tracking search results
$FilesWithAllSearchStrings = @()
$FilesMissingSearchStrings = @{}
foreach ($SearchString in $SearchStrings.Keys) {
    $FilesMissingSearchStrings[$SearchString] = @()
}

# Loop through the config files in the folder
foreach ($File in Get-ChildItem -Path $FolderPath -Filter *.txt) {
    # Read the contents of the file into a string variable
    $FileContent = Get-Content $File.FullName -Raw

    # Check if the file contains all search strings
    $FoundSearchStrings = @()
    foreach ($SearchString in $SearchStrings.Keys) {
        $StringToSearch = $SearchStrings[$SearchString]
        if ($FileContent -match $StringToSearch) {
            # Add the search string to the list of found search strings
            $FoundSearchStrings += $SearchString
        }
        else {
            # Add the file name to the list of missing search strings for this search string
            $FilesMissingSearchStrings[$SearchString] += $File.Name
        }
    }

    if ($FoundSearchStrings.Count -eq $SearchStrings.Count) {
        # Add the file to the list of files containing all search strings
        $FilesWithAllSearchStrings += $File.Name
    }
}

# Output the search results summary
Write-Host "Summary:"
if ($FilesWithAllSearchStrings.Count -gt 0) {
    Write-Host "Found $($FilesWithAllSearchStrings.Count) files containing all search strings:"
    foreach ($File in $FilesWithAllSearchStrings) {
        Write-Host "- $File"
    }
    Write-Host ""
}
if ($FilesMissingSearchStrings.Values -contains $null) {
    Write-Host "All search strings were found in all files"
}
else {
    Write-Host "Missing search strings:"
    $CSVData = @()
    foreach ($SearchString in $SearchStrings.Keys) {
        $FilesMissing = $FilesMissingSearchStrings[$SearchString]
        if ($FilesMissing.Count -gt 0) {
            Write-Host "- $SearchString"
            foreach ($File in $FilesMissing) {
                Write-Host "  - $File"
                $CSVRow = [PSCustomObject]@{
                    SearchString = $SearchString
                    FileName = $File
                }
                $CSVData += $CSVRow
            }
        }
    }
    $CSVData |export-csv "$FolderPath\mplsrouterauditresults.csv" -NoTypeInformation -Force
}

