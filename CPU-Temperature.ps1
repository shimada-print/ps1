# �Ǘ��҂Ƃ��Ď��s����Ă��邩�m�F
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)) {
    # �Ǘ��Ҍ����ōĎ��s
    $script = $MyInvocation.MyCommand.Definition
    Start-Process powershell.exe -ArgumentList "-NoExit", "-File `"$script`"" -Verb RunAs
    # �X�N���v�g�I��
    exit
}

Write-Output "�Ǘ��Ҍ����Ŏ��s���ł��B"

# CPU���x��\��
try {
    $wmi = Get-WmiObject MSAcpi_ThermalZoneTemperature -Namespace "root/wmi"
    if ($wmi) {
        Write-Output "���x�f�[�^�擾�����B"
        foreach ($item in $wmi) {
            $tempKelvin = $item.CurrentTemperature
            $tempCelsius = ($tempKelvin / 10) - 273.15
            Write-Output ("CPU���x: {0:N2} ��C" -f $tempCelsius)
        }
    } else {
        Write-Output "���x�����擾�ł��܂���ł����B"
    }
} catch {
    Write-Output "�G���[���������܂���: $_"
}

# ���L�����Ȃ��ƒ����ɏ����Č���Ȃ�
Read-Host -Prompt "Press Enter to exit"
