
function chrome(){

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
}
