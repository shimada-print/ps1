# VSCode（Code.exe）のパスを環境変数から取得
# 変数「VSC_Path_Code_exe」は環境変数の設定で
# C:\Users\UserName\AppData\Local\Programs\Microsoft VS Code\Code.exe
# などを指定する
$vscodePath = $env:VSC_Path_Code_exe

# コマンドパレットを開くための引数 (例)
$args = "-n --goto 'workbench.action.showCommands' --force"

# VSCodeを起動
Start-Process $vscodePath -ArgumentList $args

code --help

# 下記を入れないとクリック起動をするとターミナルが直ぐに消えて見れない
Read-Host -Prompt "Press Enter to exit"
