#My First PowerShell script to be run in GitHub

param(
[parameter(mandatory)]
[string]$MsgTo,
[string]$MsgSubject
)

$webBody = @"

<p><i>See this amazing content inside the email?` 
Yeah, I know right. It's amazing!!!!!! I just tried` 
to do this for, testing.</i></p>

"@

$msgFr = "noreply_test@freesmtpservers.com"
$msgSmtp = "smtp.freesmtpservers.com"

Send-MailMessage -From $msgFr -To $MsgTo -SmtpServer $msgSmtp -Subject $MsgSubject -BodyAsHtml $webBody -Port 25