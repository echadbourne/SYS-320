clear

# Deliverable 1

# Put the command into a variable so you can call it again. 
# Use Get-Process to request a list of processes, then use Where-Object to search the list.
# Search all of the process names lists for those that start with the letter C
$Cprocesses = Get-Process | Where-Object { $_.ProcessName -ilike "c*" }

# Use Write-Host to output the variable $Cprocesses
# Use Format-Table to make the output into a table, Out-String to make sure it doesn't merge.
Write-Host ($Cprocesses | Format-Table | Out-String)


clear
# Deliverable 2

# This time we are searching for the path of all processes
# Using -inotlike becuase we want to find processes that do not have System32 in the file path
# Make sure to use the * on both sides of System32 to eliminate all system processes from list. 
$Pprocesses = Get-Process | Where-Object { $_.Path -inotlike "*\System32\*" }

# Use Select-Object to choose which properties you want displayed.
Write-Host ($Pprocesses | Select-Object Path, CPU, Id, ProcessName | Format-Table | Out-String)


clear
# Deliverable 3

# Now we are asking for a list of services using Get-Service
# Then we are using Where-Object to search within that list
# Using he $_.Status variable to search for where the service statis is equal (-eq) to "Stopped)
# Sort-Object DisplayName helps us to make the list go in alphabetical order by DisplayName
$SServices = Get-Service | Where-Object { $_.Status -eq "Stopped" } | Sort-Object DisplayName

# Output the variable contents in table format (Format-Table). Don't merge with previous outputs (Out-String)
Write-Host ($SServices | Format-Table | Out-String)

# Export the variable contents to a CSV in the same location as your script.
$SServices | Export-Csv -Path "$PSScriptRoot\stopped_services.csv" -NoTypeInfo


clear
# Deliverable 4

# Command to search for the processname chrome within the list of running processes
$chrome = Get-Process | Where-Object { $_.ProcessName -eq "chrome" }

# If Chrome is not in the list of running process ($null)
if ($chrome -eq $null){	
    # Start the chrome process and navigate to www.champlain.edu.	
    Start-Process "C:\Program Files\Google\Chrome\Application\chrome.exe" "https://www.champlain.edu"
}
else{
    #if chrome is already in the list of processes (i.e. anything other than $null), stop the process.
    Stop-Process -Name "chrome" 
}