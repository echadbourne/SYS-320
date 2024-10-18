<#----------------------
Menu with the following:
 - Show Configuration
 - Change Configuration
   * This option will ask the user for new configuration 
     and replace the old configuration with new
 - Exit
------------------------#>

. (Join-Path $PSSCriptRoot ReportFunctions.ps1)

#clear

function configurationMenu($operation){

$Prompt = "Please choose your action:`n"
$Prompt += "1 - Show current configuration`n"
$Prompt += "2 - Change configuration`n"
$Prompt += "0 - Exit"

$operation = $true

while($operation){

    Write-Host $Prompt | Out-String
    $choice = Read-Host

    if($choice -eq 0){
        Write-Host "Goodbye" | Out-String
        exit
        $operation = $false
    }
    
    elseif($choice -eq 1){
        #Show current configuration
        $config = readConfiguration
        Write-Host ($config | Out-String)

    }

    elseif($choice -eq 2){
        #Change configuration

        changeConfiguration $timeBack $executionTime | Out-String
            
    }

    else{
        Write-Host "Please choose a valid option"
    }
}
}
#configurationMenu