function SendAlertEmail($Body){

$From = "elizabeth.chadbourne@mymail.champlain.edu"
$To = "elizabeth.chadbourne@mymail.champlain.edu"
$Subject = "Suspicious Activity"

$Password = "geid drnd geli nhnm" | ConvertTo-SecureString -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $From, $Password

Send-MailMessage -From $From -To $To -Subject $Subject -Body $Body -SmtpServer "smtp.gmail.com" -port 587 -UseSsl -Credential $Credential
}

SendAlertEmail "thisisatest"