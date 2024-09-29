#Get apache access logs
Get-Content -Path C:\xampp\apache\logs\access.log
#Only get the last 5
Get-Content -Path C:\xampp\apache\logs\access.log -tail 5

#Only get 404 or 400 logs
Get-Content -Path C:\xampp\apache\logs\access.log | Select-String -Pattern ' 404 ',' 400 '
#Alternate Solution
Get-ChildItem -Path C:\xampp\apache\logs\access.log | Select-String -Pattern ' 404 ',' 400 '
# Only logs that do not contain 200
Get-ChildItem -Path C:\xampp\apache\logs\access.log | Select-String -Pattern ' 200 ' -NotMatch
# From every file with .log extension, only get ones that contain "error"
$A = Get-ChildItem -Path C:\xampp\apache\logs\*.log | Select-String -Pattern 'error'

$A[-1..-5]

# Get only logs that contain 404, save into $notfounds
$notfounds = Get-Content -Path C:\xampp\apache\logs\access.log | Select-String -Pattern ' 404 '

#$regex = [regex] "\b\d{1,3}\.d{1,3}\.d{1,3}\.d{1,3}\b"
$regex = [regex] "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"
$ipsUnorganized = $regex.Matches($notfounds)

$ips = @()
for($i=0; $i -lt $ipsUnorganized.Count; $i++){
    $ips += [pscustomobject]@{ "IP" = $ipsUnorganized[$i].Value; }
}

#$ips | Where-Object { $_.IP -ilike "10.*" }


$ipsoftens = $ips | Where-Object { $_.IP -ilike "10.*" }
$counts = $ipsoftens | Group IP
$counts | Select-Object Count, Name

