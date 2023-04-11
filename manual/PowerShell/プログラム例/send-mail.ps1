# メール送信

$smtpServer = "172.16.110.16"
$smtpPort = 25

$to = "y-kawauchi@iskweb.co.jp"
$from = "y-kawauchi@iskweb.co.jp"
$subject = "Test Email"
$body = "This is a test email sent without SMTP authentication."

$smtp = New-Object System.Net.Mail.SmtpClient($smtpServer, $smtpPort)
$smtp.UseDefaultCredentials = $true
$mail = New-Object System.Net.Mail.MailMessage($from, $to, $subject, $body)

$smtp.Send($mail)
