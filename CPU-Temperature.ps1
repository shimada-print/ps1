# 管理者として実行されているか確認
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)) {
    # 管理者権限で再実行
    $script = $MyInvocation.MyCommand.Definition
    Start-Process powershell.exe -ArgumentList "-NoExit", "-File `"$script`"" -Verb RunAs
    # スクリプト終了
    exit
}

Write-Output "管理者権限で実行中です。"

# CPU温度を表示
try {
    $wmi = Get-WmiObject MSAcpi_ThermalZoneTemperature -Namespace "root/wmi"
    if ($wmi) {
        Write-Output "温度データ取得成功。"
        foreach ($item in $wmi) {
            $tempKelvin = $item.CurrentTemperature
            $tempCelsius = ($tempKelvin / 10) - 273.15
            Write-Output ("CPU温度: {0:N2} °C" -f $tempCelsius)
        }
    } else {
        Write-Output "温度情報を取得できませんでした。"
    }
} catch {
    Write-Output "エラーが発生しました: $_"
}

# 下記を入れないと直ぐに消えて見れない
Read-Host -Prompt "Press Enter to exit"
