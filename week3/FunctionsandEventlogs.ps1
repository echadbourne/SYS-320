# Get login and logoff records from Windows Events
#Get-EventLog -logname System -source Microsoft-Windows-Winlogon
function getloginlogs($days){

$loginouts = Get-EventLog -logname System -source Microsoft-Windows-Winlogon -After (Get-Date).AddDays(-$days)

$loginoutstable = @() #empty array to fill customly
for ($i=0; $i -lt $loginouts.Count; $i++){

#Creating event property value
$event = ""
if($loginouts[$i].InstanceId -eq "7001") {$event="Logon"}
if($loginouts[$i].InstanceId -eq "7002") {$event="Logoff"}

#Creating user property value
$SID = New-Object System.Security.Principal.SecurityIdentifier($loginouts[$i].ReplacementStrings[1])

$user = $SID.Translate([System.Security.Principal.NTAccount])

#Adding each new line (in form of a custom object) to our empty array
$loginoutstable += [pscustomobject]@{"Time" = $loginouts[$i].TimeGenerated; `
                                       "Id" = $loginouts[$i].InstanceId; `
                                    "Event" = $event; `
                                     "User" = $user.value; `
                                       }
} #End of for
$loginoutstable
} #end of function

#getloginlogs(15)



function getonofftime($days){

$stopstarts = Get-EventLog system -After (Get-Date).AddDays(-$days) | ?{$_.EventID -eq 6006 `
                                                                    -or $_.EventID -eq 6005 }

$stopstartstable = @() #empty array to fill customly
for ($i=0; $i -lt $stopstarts.Count; $i++){

#Creating event property value
$event = ""
if($stopstarts[$i].EventID -eq "6005") {$event="Startup"}
if($stopstarts[$i].EventID -eq "6006") {$event="Shutdown"}

#Creating user property value
$user = "System"

#Adding each new line (in form of a custom object) to our empty array
$stopstartstable += [pscustomobject]@{"Time" = $stopstarts[$i].TimeGenerated; `
                                       "Id" = $stopstarts[$i].EventId; `
                                    "Event" = $event; `
                                     "User" = $user; `
                                       }
} #End of for
$stopstartstable
} #end of function

getonofftime(15)