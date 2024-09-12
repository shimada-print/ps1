#######################################################################
#
# Dockerの動作状況を確認し日時付きで書類保存するパワーシェルスクリプト
#
#######################################################################

# スクリプト実行時の日時を取得
$dateTime = Get-Date -Format "yyyyMMdd_HHmmss"

# ファイル名を作成
$fileName = "docker_list_$dateTime.txt"

# 各コマンドの実行結果を取得
# Docker EngineとDocker Clientのバージョン情報を表示
$dockerVersion = docker version
# ホストのOS、アーキテクチャ、ストレージドライバなど、詳細な情報を表示
$dockerInfo = docker info
# Dockerイメージの一覧を表示
$dockerImages = docker images
# 全てのコンテナの一覧（実行中、停止中）を表示
$dockerPs = docker ps -a
# Swarmモードでクラスタを構成している場合、各ノードの情報（ステータス、ロールなど）を表示
$dockerNodeLs = docker node ls

# 結果をファイルに書き込む
Out-File -FilePath $fileName -InputObject $dockerVersion -Append
Out-File -FilePath $fileName -InputObject $dockerInfo -Append
Out-File -FilePath $fileName -InputObject $dockerImages -Append
Out-File -FilePath $fileName -InputObject $dockerPs -Append
Out-File -FilePath $fileName -InputObject $dockerNodeLs -Append

# ファイルが作成されたことをターミナルで通知
Write-Host "Docker情報が以下のファイルに保存されました:" $fileName

# 下記を入れないと直ぐにターミナルが消えて見れない
Read-Host -Prompt "Press Enter to exit"
