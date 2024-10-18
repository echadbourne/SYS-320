
. (Join-Path $PSScriptRoot Event-Logs.ps1)
. (Join-Path $PSScriptRoot Email.ps1)
. (Join-Path $PSScriptRoot Scheduler.ps1)
. (Join-Path $PSScriptRoot ScheduledEmailReport.ps1)

#Obtaining Configuration
$configuration = readConfiguration

#obtaining at risk users
$Failed = atRiskUsers $configuration.Days

#sending at risk users as email
SendAlertEmail ($Failed | Format-Table | Out-String)

#Setting the script to run daily
ChooseTimeToRun $configuration.ExecutionTime