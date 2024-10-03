function gatherClasses(){

$page = Invoke-WebRequest -TimeoutSec 2 http://10.0.17.16/Courses.html

#Get all the tr elements of the HTML document
$trs = $page.parsedhtml.body.getelementsbytagname("tr")

#Empty array to hold results
$FullTable = @()

for($i=1; $i -lt $trs.length; $i++){ # going over every tr element
    
    #get every td element of current tr element
    $tds = $trs[$i].getelementsbytagname("td")

    # want to separate start time and end time form one time field
    $Times = $tds[5].innerText.split("-")

    $FullTable += [pscustomobject]@{"Class Code" = $tds[0].innerText; `
                                    "Title"      = $tds[1].innerText; `
                                    "Days"       = $tds[4].innerText; `
                                    "Time Start" = $Times[0]; `
                                    "Time End"   = $Times[1]; `
                                    "Instructor" = $tds[6].innerText;
                                    "Location"   = $tds[9].innerText;
                                    }
}#end of for loop
return $FullTable
}


function daysTranslator($FullTable){

#go over every record in the table
for ($i=0; $i -lt $FullTable.length; $i++){
    #Empty array to hold days for every record
    $Days = @()

    #If you see "M" -> Monday
    if($FullTable[$i].Days -ilike "*M*") { $Days += "Monday" }

    #If you see "T" followed by T, W, or F -> Tuesday
    if($FullTable[$i].Days -ilike "*T[T,W,F]*") { $Days += "Tuesday" }

    #If you see "W" -> Wednesday
    if($FullTable[$i].Days -ilike "*W*") { $Days += "Wednesday" }

    if($FullTable[$i].Days -ilike "*TH*") { $Days += "Thursday" }

    if($FullTable[$i].Days -ilike "*F*") { $Days += "Friday" }

    $FullTable[$i].Days = $Days
}
return $FullTable
}
