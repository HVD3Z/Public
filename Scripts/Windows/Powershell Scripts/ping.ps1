# This script will run and scrape up / down status of each ip specified in the burner.txt file

$ipList = Get-Content -Path "%USERPROFILE%\Downloads\burner.txt"
$outputFile = "%USERPROFILE%\Downloads\ip_list.txt"

foreach ($ip in $ipList) {
    $ping = Test-Connection -ComputerName $ip -Count 1 -Quiet

    if ($ping) {
        Write-Output "$ip is online." | Out-File -FilePath $outputFile -Append
    } else {
        Write-Output "$ip is offline." | Out-File -FilePath $outputFile -Append
    }
}
