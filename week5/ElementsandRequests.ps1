$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.16/ToBeScraped.html

#$scraped_page.links.count

#display links as html elements

$scraped_page.links | select href, outerText


#$h2s = $scraped_page.AllElements.body.getElements | Select outerText