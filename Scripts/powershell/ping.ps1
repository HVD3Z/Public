$ipList = Get-Content -Path "C:\Users\eyoung\Downloads\burner.txt"
$outputFile = "C:\Users\eyoung\Downloads\ip_list.txt"

foreach ($ip in $ipList) {
    $ping = Test-Connection -ComputerName $ip -Count 1 -Quiet

    if ($ping) {
        Write-Output "$ip is online." | Out-File -FilePath $outputFile -Append
    } else {
        Write-Output "$ip is offline." | Out-File -FilePath $outputFile -Append
    }
}
