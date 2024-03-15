# Create a file called burner.txt and place in root of user folder.
$ipList = Get-Content -Path "%USERPROFILE%\burner.txt"
# Results file will be listed in the following file.
$outputFile = "%USERPROFILE%\ip_list.txt"

foreach ($ip in $ipList) {
    $ping = Test-Connection -ComputerName $ip -Count 1 -Quiet

    if ($ping) {
        Write-Output "$ip is online." | Out-File -FilePath $outputFile -Append
    } else {
        Write-Output "$ip is offline." | Out-File -FilePath $outputFile -Append
    }
}   
Write-Host "Scan complete. Please find results located in $outputFile..." 