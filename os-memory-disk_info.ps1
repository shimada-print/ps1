### OS�ƃ������[�Ɠ����f�B�X�N��IP�A�h���X�̏������W���t�@�C���o�͂���PowerShell�X�N���v�g ###
# 2024�N9��7����AI���g�����͎����v�����v�g���AAI���v���O���~���O�݂̂��A30���قǂŊ���
# Win32�Ȃ̂�Windows�݂̂ŉ����H�́APowerShellCore�̃}���`OS�Ή����炵�ĕs��
# Domain�͓��Ɍl���p�̏ꍇ�̓��[�N�O���[�v�̏ꍇ������


# �ȉ���AI���v���O���~���O
# �������擾���ăt�@�C�����Ɋ܂߂�
$dateTime = Get-Date -Format "yyyyMMdd_HHmmss"
$fileName = "os-memory-disk_info_{0}.txt" -f $dateTime

# �V�X�e�����A�������`�b�v���A�����f�B�X�N�����擾
$systemInfo = systeminfo
$memoryInfo = wmic memorychip get /value
$diskInfo = wmic diskdrive get /value

# CPU���x���擾 (WMI���g�p)
$cpuTemp = (Get-WmiObject Win32_TemperatureSensor -Filter "SensorType='CPU'").Temperature 2> $null

# ���������x���擾 (WMI���g�p�A�����������̏ꍇ�A���ړI�ȃ��������x�͎擾�ł��Ȃ�)
$memoryTemp = (Get-WmiObject Win32_TemperatureSensor -Filter "SensorType='Memory'").Temperature 2> $null

# �f�B�X�N���x���擾 (WMI���g�p)
$diskTemp = (Get-WmiObject Win32_PhysicalMedia).Temperature 2> $null

# IP�A�h���X���擾
$ipAddresses = Get-NetIPAddress | Select-Object IPAddress

# �擾�������𕶎���Ɍ���
$allInfo = $systemInfo + "`n" + $memoryInfo + "`n" + $diskInfo + "`n"
$allInfo += "CPU Temperature: $cpuTemp ��"
$allInfo += "`nMemory Temperature: $memoryTemp ��"
$allInfo += "`nDisk Temperature: $diskTemp ��"
$allInfo += "`nIP Addresses:"
foreach ($ipAddress in $ipAddresses) {
    $allInfo += "`n  - $ipAddress.IPAddress"
}

# ���ʂ��t�@�C���ɏo�́iUTF-8�ŃG���R�[�h�j
Out-File -FilePath $fileName -Encoding utf8 -InputObject $allInfo

# ���ʂ�\���i�ꎞ�I�ɕ\������ꍇ�̓R�����g�A�E�g���O���j
Write-Host "�V�X�e�����"
$systemInfo
Write-Host "�������`�b�v���"
$memoryInfo
Write-Host "�����f�B�X�N���"
$diskInfo
Write-Host "CPU���x: $cpuTemp ��"
Write-Host "���������x: $memoryTemp ��"
Write-Host "�f�B�X�N���x: $diskTemp ��"
Write-Host "IP�A�h���X:"
$ipAddresses | Format-Table -AutoSize


# ���L�����Ȃ��ƃN���b�N�ŋN�������ꍇ�͒����ɏ����Č���Ȃ�
Read-Host -Prompt "Press Enter to exit"