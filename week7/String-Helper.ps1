<# String-Helper
*************************************************************
   This script contains functions that help with String/Match/Search
   operations. 
************************************************************* 
#>


<# ******************************************************
   Functions: Get Matching Lines
   Input:   1) Text with multiple lines  
            2) Keyword
   Output:  1) Array of lines that contain the keyword
********************************************************* #>
function getMatchingLines($contents, $lookline){

$allines = @()
$splitted =  $contents.split([Environment]::NewLine)

for($j=0; $j -lt $splitted.Count; $j++){  
 
   if($splitted[$j].Length -gt 0){  
        if($splitted[$j] -ilike $lookline){ $allines += $splitted[$j] }
   }

}

return $allines
}

<#*******************************************
Check Password for requirements
********************************************#>

function checkPassword($passwd){

    write-host $passwd
    if($passwd.Length -lt 6){
        Write-Host "Failed Length Test" | Out-String
        return $false
        }
    elseif($passwd -inotlike '*[0-9]*'){
        Write-Host "Digit-Test Failed" | Out-String
        return $false
        }
    elseif($passwd -inotlike '*[^a-zA-Z0-0]*'){
        Write-Host "Failed Special Character Test" | Out-String
        return $false
        }
  else{
  Write-Host "Here"
  return $true }
}
        