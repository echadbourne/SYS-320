#1

(Get-NetIPAddress -AddressFamily IPv4 |where {$_.InterfaceAlias -ilike "Ethernet0"}).IPAddress

#2

(Get-NetIpAddress -AddressFamily IPv4 | where {$_.InterfaceAlias -ilike "Ethernet0"}).PrefixLength

#3 and 4

Get-WmiObject -List | Where-Object { $_.Name -ilike "Win32_net*" } | Sort-Object

#5 and 6

Get-CimInstance Win32_NetworkAdapterConfiguration -Filter "DHCPEnabled=true" `
| Select DHCPServer | Format-Table -HideTableHeaders

#7

(Get-DnsClientServerAddress -AddressFamily IPv4 | `
Where-Object {$_.InterfaceAlias -ilike "Ethernet0"}).ServerAddresses[0]

#8

cd $PSScriptRoot

$files=(Get-ChildItem)
for ($j=0; $j -le $files.Count; $j++){
    if($files[$j].Extension -ilike "*ps1"){
        Write-Host $files[$j].Name
        }
}

#9

$folderpath="$PSScriptRoot\outfolder"
if(Test-Path $folderpath){
    Write-Host "FolderAlreadyExists"
}
else{
    New-Item -Itemtype "directory" -Path $folderpath
}

#10

cd $PSScriptRoot
$files=(Get-ChildItem)

$folderpath = "$PSScriptRoot/outfolder/"
$filepath = Join-Path -Path $folderpath "out.csv"

$files | Where-Object { $_.extension -eq ".ps1" } | Export-Csv -Path $filepath

#11

$files= Get-ChildItem -Recurse -File
$files | Rename-Item -NewName { $_.Name -replace '.csv', '.log'}
Get-ChildItem -Recurse -File