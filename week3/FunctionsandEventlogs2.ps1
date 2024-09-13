. (Join-Path $PSScriptRoot FunctionsandEventlogs.ps1)

clear

$loginoutstable = getloginlogs(15)
$loginoutstable

#Get shut downs and startups from past 25 days

$stopstartstable = getonofftime(25)
$stopstartstable
