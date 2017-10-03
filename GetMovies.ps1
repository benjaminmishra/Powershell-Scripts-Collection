$websiteName = "https://fmovies.se/fmovies"
$websiteLinks = Invoke-WebRequest -Uri $websiteName

$date = Get-Date -Format "FileDate"

$html = $websiteLinks.links | 
    Where-Object {$_.class -eq "name"} | 
    Select-Object -Unique @{name="Movie";expression={$_.innerHtml}},@{name="Link";expression={"https://fmovies.se"+$_.href}} | 
    ConvertTo-Html | Out-File ./Movies"$date".html
