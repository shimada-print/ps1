# �Ǘ��҂Ƃ��Ď��s����Ă��邩�m�F
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)) {
    # �Ǘ��Ҍ����ōĎ��s
    $script = $MyInvocation.MyCommand.Definition
    Start-Process powershell.exe -ArgumentList "-NoExit", "-File `"$script`"" -Verb RunAs
    # �X�N���v�g�I��
    exit
}

# �����ɊǗ��Ҍ����Ŏ��s�������R�[�h��ǉ�
Write-Output "�Ǘ��҂Ƃ���PowerShell�����s����Ă��܂��B"

# ���L�����Ȃ��ƒ����ɏ����Č���Ȃ�
Read-Host -Prompt "Press Enter to exit"
