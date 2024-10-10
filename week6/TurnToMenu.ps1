<#---------------------------
Menu with the following:
 - Last 10 Apache logs (from Parsing Apache Logs)
 - Last 10 failed logins (From Event-Logs)
 - At Risk Users (?)
 - Start Chrome Web Browser and navigate to champlain.edu (Process Management)
 =----------------------------#>
. (Join-Path $PSScriptRoot ParsingApacheLogs.ps1)
. (Join-Path $PSScriptRoot Event-Logs.ps1)
. (Join-Path $PSScriptRoot ProcessManagement.ps1)

clear

$Prompt  = "Please choose your operation:`n"
$Prompt += "1 - Display last 10 Apache Logs`n"
$Prompt += "2 - Display last 10 failed logins all users`n"
$Prompt += "3 - At Risk Users`n"
$Prompt += "4 - Start Chrome to champlain.edu`n"
$Prompt += "5 - Exit`n"

$operation = $true

while($operation){

    Write-Host $Prompt | Out-String
    $choice = Read-Host

    if($choice -eq 5){
        Write-Host "Goodbye" | Out-String
        exit
        $operation = $false
    }

    elseif($choice -eq 1){
        #Display last 10 Apache Logs
        $tableRecords = ApacheLogs
        write-host ($tableRecords | select -last 10 | Format-Table -AutoSize -Wrap | out-string)
    }

    elseif($choice -eq 2){
        #Display last 10 failed logins
        $userLogins = getFailedLogins 10
        write-host ($userLogins | format-table | out-string)
    }

    elseif($choice -eq 3){
        $timeSince = Read-Host -Prompt "Please enter the number of days to search back"
        $users = atRiskUsers($timeSince)
        Write-Host ($users | Group-Object User | Where-Object {$_.count -ge 9} | select count, name | Format-Table | Out-String)
        }
    elseif($choice -eq 4){
        #Start chrome to champlain.edu
        $chromeaction = chrome
        $chomeaction
    }
}
