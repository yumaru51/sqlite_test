$logName = "Microsoft-Windows-TaskScheduler/Operational"
$source = "Microsoft-Windows-TaskScheduler"
$maxEvents = 1
$events = Get-WinEvent -FilterHashtable @{LogName=$logName; ProviderName=$source; Id=329} -MaxEvents $maxEvents

if ($events) {
    $output = ""
    foreach ($event in $events) {
        $taskName = $event.Properties[0].Value
        if ($taskName -like "*PI_IMPORT3*") {
            $output += $taskName + "`n"
        }
    }
}

if ($output) {
    $smtpServer = "172.16.110.16"
    $smtpPort = 25

    $to = "y-kawauchi@iskweb.co.jp"
    $from = "y-kawauchi@iskweb.co.jp"
    $subject = "DrSum��PI�f�[�^�捞�����G���[�ʒm"

    $body = "YDRSUM2�T�[�o�[��DrSum��PI�f�[�^�捞�������G���[�ƂȂ�܂����B`n`n"

    $body = $body + "�c�Ɠ���8���̃��[���Ď��̏ꍇ�AYDRSUM2�T�[�o�[�Ƀ����[�g�f�X�N�g�b�v�ڑ����āA`n"
    $body = $body + "�^�X�N���������s���Ă��������B`n"
    $body = $body + "<\\yfileserv\data\���V�X�e��\�A�v��\�p�b�P�[�W\03_DrSum\010_�^�p\04_PI�f�[�^�捞\PI�f�[�^�Ď捞�菇.xlsx>`n`n"

    $body = $body + "�Y���^�X�N�͉��L�ƂȂ�܂��B`n"
    $body = $body + $output

    $body = $body + "`n�c�Ɠ���8���ȊO�̏ꍇ�A�X���[���Ă��������B`n"

    $smtp = New-Object System.Net.Mail.SmtpClient($smtpServer, $smtpPort)
    $smtp.UseDefaultCredentials = $true

    $mail = New-Object System.Net.Mail.MailMessage($from, $to, $subject, $body)

    $smtp.Send($mail)
}
