$retrycount = 0
$maxretries = 3
$SleepSeconds = 5
[int]$status = 0

while($retrycount++ -lt $maxretries) {
    $response = Invoke-WebRequest https://google.com -Method Get
    $statusCode = $response.StatusCode
    
    if ($statusCode -eq 204){
        $status = 1
        break
    } else {
        Write-Host "Status code is $statusCode"
        Start-Sleep -Seconds $SleepSeconds
        Write-Warning "Retrying ..."
    }
}

if ($status -eq 1) {
    Write-Host "Healthy"
} else {
    Write-Error "Unhealthy"
}
