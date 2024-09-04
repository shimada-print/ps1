# CPU温度を取得するスクリプト
$wmi = Get-WmiObject MSAcpi_ThermalZoneTemperature -Namespace "root/wmi"

if ($wmi) {
    foreach ($item in $wmi) {
        $tempKelvin = $item.CurrentTemperature
        $tempCelsius = ($tempKelvin / 10) - 273.15
        Write-Output ("CPU温度: {0:N2} °C" -f $tempCelsius)
    }
} else {
    Write-Output "温度情報を取得できませんでした。"
}


Read-Host -Prompt "Press Enter to exit"
