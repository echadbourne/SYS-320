. (Join-Path $PSScriptRoot ParsingApacheLogs.ps1)
. (Join-Path $PSScriptRoot Apache-LogsFunction.ps1)

$results = getIPsforSite "*l" "404" "Chrome"
$results

#$tableRecords = ApacheLogs
#$tableRecords | Format-Table -AutoSize -Wrap