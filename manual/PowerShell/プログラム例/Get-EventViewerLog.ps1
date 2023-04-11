# イベントビューアーログ取得

$logName = "Microsoft-Windows-TaskScheduler/Operational"
$source = "Microsoft-Windows-TaskScheduler"
$maxEvents = 10
$events = Get-WinEvent -FilterHashtable @{LogName=$logName; ProviderName=$source; } -MaxEvents $maxEvents
$outputFile = "C:\Users\y-kawauchi\Desktop\TaskSchedulerEvents.txt"

if ($events) {
    $output = ""
    foreach ($event in $events) {
        $taskName = $event.Properties[0].Value
        $output += $event.TimeCreated.ToString() + "`t" + $event.Id + "`t" + $taskName + "`t" + $event.Message + "`n"
    }
    Set-Content -Path $outputFile -Value $output
}
