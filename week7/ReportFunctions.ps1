#functions for reading and changing configuration


function changeConfiguration(){
    #read the first input from the host
    $timeBack = Read-Host "Please enter the number of days for which logs will be obtained: "


    $operation = $true
    $operation2 = $false



    #check if they match the requirements
    while($operation){
    if($timeBack -match "^\d+$"){
        Write-Host "Day Match"
        $confDay = $timeBack
        $operation = $false
        $operation2 = $true
    }
    else{
        $timeBack = Read-Host "Please enter a number"
        
    }
    }

    $executionTime = Read-Host "Please enter the execution time for the script: "

    while($operation2){

    if($executionTime -match "^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$"){
        Write-Host "Time Match"
        $confTime = $executionTime
        $operation2 = $false
    }
    else{
        $executionTime = Read-Host "Please enter a valid time: xx:yy"
    }
    }

    #export to file
    $confDay | Out-File -FilePath C:\Users\champuser\SYS-320\week7\configuration.txt
    $confTime | Out-File -FilePath C:\Users\champuser\SYS-320\week7\configuration.txt -Append
}

function readConfiguration(){
    $configuration = Get-Content "C:\Users\champuser\SYS-320\week7\configuration.txt"

    $configurationtable = @()

    $configurationtable += [pscustomobject]@{"Days" = $configuration[0]; `
                                             "ExecutionTime" = $configuration[1]
                                             }
    

    return $configurationtable
}