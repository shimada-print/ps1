# Bunのインストールスクリプト
param(
    [string]$bunVersion = "latest" # インストールするBunのバージョン（デフォルト: latest）
)

# インストールコマンド
$installCommand = "irm bun.sh/install.ps1 | iex"

# バージョンを指定する場合
if ($bunVersion -ne "latest") {
    $installCommand = "irm bun.sh/install.ps1 -version $bunVersion | iex"
}

# インストール実行
Invoke-Expression $installCommand
