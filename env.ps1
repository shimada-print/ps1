# 環境変数を表示するスクリプト

# システム環境変数の表示
Write-Output "システム環境変数:"
Get-ChildItem Env:

# 特定の環境変数を表示する例
# Write-Output "PATH 環境変数:"
# Write-Output $env:PATH

# 上記はChatGPTにかいてもらった
# 下記を入れないと直ぐに消えて見れない

Read-Host -Prompt "Press Enter to exit"
