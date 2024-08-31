# Windows PowerShellで楽な自動化
従来の自動化なスクリプトはBATやVBSでしたが、  
今はNode.jsやPythonやGo言語やPowerShellです。  

Node.jsは需要が多く、Pythonは唯一AIとの連携が強く、  
Go言語はスマホのアプリも作れ、PoewrShellは手軽です。

Windows上で自動処理などが出来るVBSは防犯上などから、  
廃止されるので、VBSのソースコードをChatGPTで簡単に  
置き換えも出来ますので、PowerShellから学ぶと効率が  
良いです。

## PowerShellは従来のシェルと違い高防犯です
初めてPowerShellでスクリプトを作成し、実行しようとすると  
「デジタル署名がされていないので実行できません」と英文で  
表示されますので、署名するか署名を無効にしても実行できる  
ようにしましょう。

署名をすると防犯上は良いのですが、開発段階では手間が  
かかるので、作成者アカウントなら無署名でも実行可に  
すると便利です。

### Set-ExecutionPolicy RemoteSigned
上記ののコマンドをPowerShallなどで入力すると、ローカルで  
作成した無署名の書類は実行できますが、インターネットから  
ダウンロードした身元不明な書類は防犯上、実行できません。

![PowerShallを実行する](./image/PowerShellExe.jpg)
