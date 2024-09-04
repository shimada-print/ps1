# CPU���x���擾����X�N���v�g
$wmi = Get-WmiObject MSAcpi_ThermalZoneTemperature -Namespace "root/wmi"

if ($wmi) {
    foreach ($item in $wmi) {
        $tempKelvin = $item.CurrentTemperature
        $tempCelsius = ($tempKelvin / 10) - 273.15
        Write-Output ("CPU���x: {0:N2} ��C" -f $tempCelsius)
    }
} else {
    Write-Output "���x�����擾�ł��܂���ł����B"
}


Read-Host -Prompt "Press Enter to exit"
