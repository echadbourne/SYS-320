Write-Host "Deliverable 1"

Get-Process -Name C*

Write-Host "Deliverable 2"

Get-Process | sort-object {$_.name -notin "system32"}

Write-Host "Deliverable 3"

$folderpath = "$PSScriptRoot/outfolder/"
$filepath = Join-Path -Path $folderpath "services.csv"
Get-Service | Where-Object {$_.Status -eq "Stopped"} | Sort-Object | Export-Csv -Path $filepath
Write-Host "Output saved to $filepath"

Write-Host "Deliverable 4"

$chromefilepath = "C:\Program Files\Google\Chrome\Application\chrome.exe"

$url = "champlain.edu"

if(Get-Process | ?{$_.path -eq $chromefilepath}){
    Stop-Process -ProcessName chrome
    Write-Host "Chrome has stopped"
}
else{
    Start-Process -Filepath $chromefilepath $url
    Write-Host "Chrome has been started at champlain.edu"
}
