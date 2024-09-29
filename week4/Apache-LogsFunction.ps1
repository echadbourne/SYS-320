
function getIPsforSite($page, $code, $browser){
    $page
    $code
    $browser


    $results = Get-Content -Path C:\xampp\apache\logs\access.log | Select-String -Pattern ($browser) -SimpleMatch
        #where { $_ | Select-String -Pattern $code } |
        #where { $_ | Select-String -Pattern $browser} 
    $results
    $regex = [regex] "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"
    $ipsUnorganized = $regex.Matches($results)

    $ips = @()
    for($i=0; $i -lt $ipsUnorganized.Count; $i++){
        $ips += [pscustomobject]@{ "IP" = $ipsUnorganized[$i].Value; }
    }


    $ipsoftens = $ips | Where-Object { $_.IP -ilike "10.*" }
    $counts = $ipsoftens | Group IP
    $counts | Select-Object Count, Name
}


getIPsforSite("index.html","404","Chrome")
