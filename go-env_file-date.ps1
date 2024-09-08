# Go言語の動作環境を表示し出力日時ごとの書類名になるアプリ

# 日時を取得し書類に出力日時も命名
$dateTime = Get-Date -Format "yyyyMMdd_HHmmss"
$fileName = "go_env_$dateTime.txt"

# ターミナルに表示
go env

# ファイルに保存
go env > $fileName

# 下記を入れないとターミナルが直ぐに消えて見れない
Read-Host -Prompt "Press Enter to exit"
