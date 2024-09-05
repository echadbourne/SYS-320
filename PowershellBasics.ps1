#(Get-NetIPAddress -AddressFamily IPv4 |where {$_.InterfaceAlias -ilike "Ethernet0"}).IPAddress

#(Get-NetIpAddress -AddressFamily IPv4 | where {$_.InterfaceAlias -ilike "Ethernet0"}).PrefixLength

#Get-WmiObject -List | Where-Object { $_.Name -ilike "Win32_net*" } | Sort-Object

#Get-CimInstance Win32_NetworkAdapterConfiguration -Filter "DHCPEnabled=true" `
#| Select DHCPServer | Format-Table -HideTableHeaders

#(Get-DnsClientServerAddress -AddressFamily IPv4 | `
#Where-Object {$_.InterfaceAlias -ilike "Ethernet0"}).ServerAddresses[0]

#cd $PSScriptRoot

#$files=(Get-ChildItem)
#for ($j=0; $j -le $files.Count; $j++){
#    if($files[$j].Extension -ilike "*ps1"){
#        Write-Host $files[$j].Name
#        }
#}

#$folderpath="$PSScriptRoot\outfolder"
#if(Test-Path $folderpath){
#    Write-Host "FolderAlreadyExists"
#}
#else{
#    New-Item -Itemtype "directory" -Path $folderpath
#}

#cd $PSScriptRoot
#$files=(Get-ChildItem)

#$folderpath = "$PSScriptRoot/outfolder/"
#$filepath = Join-Path -Path $folderpath "out.csv"

#$files | Where-Object { $_.extension -eq ".ps1" } | Export-Csv -Path $filepath

$files= Get-ChildItem -Recurse -File
$files | Where-Object - { $_.Extension -creplace '.csv', '.log'}
Get-