$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.16/ToBeScraped.html

#$scraped_page.links.count

#display links as html elements

#$scraped_page.links | select href, outerText


$h2s = $scraped_page.parsedhtml.body.getElementsbytagname("h2") | Select outertext
#$h2s

# Print the innertext of every div element that has the class as "div-1"

$divs1 = $scraped_page.parsedhtml.body.getelementsbytagname("div") | where { `
$_.getAttributeNode('class').Value -ilike "div-1"} | select innertext

$divs1