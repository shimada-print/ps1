# 管理者として実行されているか確認
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)) {
    # 管理者権限で再実行
    $script = $MyInvocation.MyCommand.Definition
    Start-Process powershell.exe -ArgumentList "-NoExit", "-File `"$script`"" -Verb RunAs
    # スクリプト終了
    exit
}

# ここに管理者権限で実行したいコードを追加
Write-Output "管理者としてPowerShellが実行されています。"

# 下記を入れないと直ぐに消えて見れない
Read-Host -Prompt "Press Enter to exit"
