# 管理者権限確認
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administra ? 
tor")) {
    Start-Process powershe ? 
ll.exe "-Command", "& '$MyInvocation.MyCommand.Path' -Elevation"
    exit
}

# コピー元のフォルダパス (適宜変更)
$sourceFolder = "C:\Users\ユーザ名\Documents\コピーするフォルダ名"

# コピー先のUSBメモリーやSDカードのドライブレター (適宜変更)
$destinationDrive = "D:"

# コピー先のフォルダ名
$destinationFolder = "コピーしたフォルダー名"

# コピー先のフルパス
$destinationPath = Join-Path -Path $destinationDrive -ChildPath $destinationFolder

# コピー先のフォルダが存在しない場合に作成
if (!(Test-Path $destinationPath)) {
    New-Item -ItemType Directory -Path $destinationPath
}

# フォルダを再帰的にコピー
Copy-Item -Path $sourceFolder -Destination $destinationPath -Recurse -Force