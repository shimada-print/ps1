# PowerShellで楽な自動化をする方法
自動化とは例えば1時間おきに自動的に書類を保存  
したり、ボタンを１つ押すだけ複数の作業をして  
くれるという、無駄の削減ということになります。  

## モダンを覚えないとAI普及で職を失います
従来の自動化なスクリプトはBATやVBSでしたが、  
今はNode.jsやPythonやGo言語やPowerShellです。  
しかしPowerShell以外は専門的で習得がやや困難です。

Node.jsは需要が多く、Pythonは唯一AIとの連携が強く、  
Go言語はスマホのアプリも作れますが、PowerShellのみ  
WindowsOSをインストール直後から付属なので手軽です。

Windows上で自動処理などが出来るVBSは防犯上などから、  
廃止されるので、VBSのソースコードをChatGPTで簡単に  
置き換えも出来ますので、PowerShellから学ぶと効率が  
良いです。

VBSは廃止ですが、VBAはExcelとAIで連携で残るでしょう。  
事務系な一般的な業務はPowerShellとVBAということです。

## PowerShellは従来のシェルと違い高防犯です
初めてPowerShellでスクリプトを作成し、実行しようとすると  
「デジタル署名がされていないので実行できません」と英文で  
表示されますので、署名するか署名を無効にしても実行できる  
ようにしましょう。

署名をすると防犯上は良いのですが、開発段階では手間が  
かかるので、作成者アカウントなら無署名でも実行可に  
すると便利です。

### 初心者が最初につまずく点はコレです
```
Set-ExecutionPolicy RemoteSigned
```
上記ののコマンドをPowerShallなどで入力すると、ローカルで  
作成した無署名の書類は実行できますが、インターネットから  
ダウンロードした身元不明な書類は防犯上、実行できません。

### PowerShallで実行するには右クリックします
ターミナルからコマンド入力しても実行はできますが、  
クリックして実行ができて、こちらの方が楽です。  

下図のように右クリックを1回するとメニューが出てきます。  
![PowerShallで実行する](./image/PowerShellExe.jpg)  
上図のメニューの上から２番目の「PowerShell で実行」  
を選ぶとPowerShellで作成書類が動作（実行）します。  

ダブルクリックをするとnotepadで編集できて、メニューの  
３番目の「編集」を選ぶとPowerShellの専用アプリで編集  
できます。

### 大規模なバックグラウンドシステムはGo言語が向いています
大規模なシステムはLinuxで作られることが多くて、PowerShell  
で作るのは、やや困難です。またGo言語でも同じようなことが  
できます。「Go言語はPCアプリの操作はできないのでは？」  
と思う人もいるかもしれませんが、下記のようにできます。  

Go言語は他と違い、速度が早いや違う人が作成しても、  
同じソースコードになりやすいなどで大規模システムの  
自動化などに向いていると思います。  

#### Go言語でPC内のメモ帳（アプリ）を操作するコード
```go
package main

import (
    "fmt"
    "os/exec"
)

func main() {
    // メモ帳 (Notepad) を起動する
    cmd := exec.Command("notepad.exe")
    err := cmd.Start() // コマンドを開始
    if err != nil {
        fmt.Println("エラー:", err)
        return
    }
    fmt.Println("メモ帳を起動しました")
}
package main

import (
    "fmt"
    "os/exec"
)

func main() {
    // メモ帳 (Notepad) を起動する
    cmd := exec.Command("notepad.exe")
    err := cmd.Start() // コマンドを開始
    if err != nil {
        fmt.Println("エラー:", err)
        return
    }
    fmt.Println("メモ帳を起動しました")
}
```

## 参照  
- [推奨なPowerShallインストール方法](https://learn.microsoft.com/ja-jp/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.4#install-powershell-using-winget-recommended)  
- [PowerShall開発元のリポジトリ](https://github.com/PowerShell/PowerShell) 
