. (Join-Path $PSScriptRoot ParsingApacheLogs.ps1)

$tableRecords = ApacheLogs
$tableRecords | Format-Table -AutoSize -Wrap