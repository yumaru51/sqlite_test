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
    $subject = "DrSumのPIデータ取込処理エラー通知"

    $body = "YDRSUM2サーバーでDrSumのPIデータ取込処理がエラーとなりました。`n`n"

    $body = $body + "営業日の8時のメール監視の場合、YDRSUM2サーバーにリモートデスクトップ接続して、`n"
    $body = $body + "タスク処理を実行してください。`n"
    $body = $body + "<\\yfileserv\data\情報システム\アプリ\パッケージ\03_DrSum\010_運用\04_PIデータ取込\PIデータ再取込手順.xlsx>`n`n"

    $body = $body + "該当タスクは下記となります。`n"
    $body = $body + $output

    $body = $body + "`n営業日の8時以外の場合、スルーしてください。`n"

    $smtp = New-Object System.Net.Mail.SmtpClient($smtpServer, $smtpPort)
    $smtp.UseDefaultCredentials = $true

    $mail = New-Object System.Net.Mail.MailMessage($from, $to, $subject, $body)

    $smtp.Send($mail)
}
