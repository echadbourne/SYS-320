
function getIPsforSite($page, $code, $browser){


    $results = Get-Content -Path C:\xampp\apache\logs\access.log | Select-String -Pattern " /$page" | Select-String -Pattern " $code " | Select-String -Pattern " $browser/"


    return $results
}


$results = getIPsforSite "*l" "404" "Chrome"
$results
