###############################################################################################################
#　OSとメモリーと内蔵ディスクとIPアドレスの情報を収集しファイル出力するPowerShellスクリプト ver.1　　2024年9月7日
###############################################################################################################
# ・特に安いPCや部品を購入時に製品スペックや温度で故障状態を知りたくなるが調べるのが、これなら簡単と思い作成した。
# ・PCのスペックや状態を記録したファイルの出力日時をファイル名にすることで、ファイルの上書き紛失も防げるようにした。
# ・2024年9月7日にAIを使い企画は私がプロンプトし、AI（を研究も主旨）がプログラミングのみし、30分ほどで完成した。
# ・「以下のコードがWin32なのでWindows上のみで可動か？」は、PowerShellCoreのマルチOS対応からして不明。
# ・Domainは特に個人利用の場合はワークグループの場合もあり、ファイル共有などで必要な情報。
# ・IPアドレスはプライベート（VNCで設定必要）やローカルホストも出力し、グローバルは出力しない場合もある。
# ・文字化けする場合もあるが、これはソフトでは無くハードに問題がある場合も有りえるし、化けも少しなので使用は問題は無い。
# https://github.com/shimada-print/
###############################################################################################################

### 以下がAIがプログラミング ###
# 日時を取得してファイル名に含める
$dateTime = Get-Date -Format "yyyyMMdd_HHmmss"
$fileName = "os-memory-disk_info_{0}.txt" -f $dateTime

# システム情報、メモリチップ情報、内蔵ディスク情報を取得
$systemInfo = systeminfo
$memoryInfo = wmic memorychip get /value
$diskInfo = wmic diskdrive get /value

# CPU温度を取得 (WMIを使用)
$cpuTemp = (Get-WmiObject Win32_TemperatureSensor -Filter "SensorType='CPU'").Temperature 2> $null

# メモリ温度を取得 (WMIを使用、ただし多くの場合、直接的なメモリ温度は取得できない)
$memoryTemp = (Get-WmiObject Win32_TemperatureSensor -Filter "SensorType='Memory'").Temperature 2> $null

# ディスク温度を取得 (WMIを使用)
$diskTemp = (Get-WmiObject Win32_PhysicalMedia).Temperature 2> $null

# IPアドレスを取得
$ipAddresses = Get-NetIPAddress | Select-Object IPAddress

# 取得した情報を文字列に結合
$allInfo = $systemInfo + "`n" + $memoryInfo + "`n" + $diskInfo + "`n"
$allInfo += "CPU Temperature: $cpuTemp ℃"
$allInfo += "`nMemory Temperature: $memoryTemp ℃"
$allInfo += "`nDisk Temperature: $diskTemp ℃"
$allInfo += "`nIP Addresses:"
foreach ($ipAddress in $ipAddresses) {
    $allInfo += "`n  - $ipAddress.IPAddress"
}

# 結果をファイルに出力（UTF-8でエンコード）
Out-File -FilePath $fileName -Encoding utf8 -InputObject $allInfo

# 結果を表示（一時的に表示する場合はコメントアウトを外す）
Write-Host "システム情報"
$systemInfo
Write-Host "メモリチップ情報"
$memoryInfo
Write-Host "内蔵ディスク情報"
$diskInfo
Write-Host "CPU温度: $cpuTemp ℃"
Write-Host "メモリ温度: $memoryTemp ℃"
Write-Host "ディスク温度: $diskTemp ℃"
Write-Host "IPアドレス:"
$ipAddresses | Format-Table -AutoSize

##### 以下のヘッダーは本スクリプト以外の多くのPowerShellスクリプトでも使った方が良い即終了させない機能 #####
# ・ターミナルで文字入力でコマンド（命令）すると面倒なので、簡単にクリックで起動を人間が設計した。
# ・AIが以下のコメントを「任意のキー入力待ち」と変えてしまうという、上記が分からなくなる仕様になっている模様。
# ・下記を入れないと本スクリプトを右クリック後に[PowerShellで起動]した場合は、直ぐにターミナルが消えて見れない。
Read-Host -Prompt "Press Enter to exit"
