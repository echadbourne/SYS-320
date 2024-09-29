function ApacheLogs(){
$logsNotFormatted = Get-Content -Path C:\xampp\apache\logs\access.log
$tableRecords = @()

for($i=0; $i -lt $logsNotFormatted.Count; $i++){
$words = $logsNotFormatted[$i].Split(" ")
#$words
$tableRecords += [pscustomobject]@{ "IP" = $words[0];
                                    "Time" = $words[3].Trim('[');
                                    "Method" = $words[4].Trim('"');
                                    "Page" = $words[5];
                                    "Protocol" = $words[6];
                                    "Response" = $words[7];
                                    "Referrer" = $words[8];
                                    "Client" = $words[11..($words.Length)];}
    

#$tableRecords
}#end of for
return $tableRecords | Where-Object { $_.IP -match "10.*" }

}

#$tableRecords = ApacheLogs
#$tableRecords | Format-Table -AutoSize -Wrap