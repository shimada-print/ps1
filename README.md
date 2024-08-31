# Windows PowerShallで楽な自動化
従来の自動化なスクリプトはBATやVBSでしたが、  
今はNode.jsやPythonやGo言語やPowerShallです。  

Node.jsは需要が多く、Pythonは唯一AIとの連携が強く、  
Go言語はスマホのアプリも作れ、PoewrShallは手軽です。

## ps1とはPowerShallの拡張子です
Windows上で自動処理などが出来るVBSは防犯上などから、  
廃止されるので「PowerShall.ps1」を学びましょう。

## PowerShallは従来のシェルと違い高防犯です
初めてPowerShallでスクリプトを作成し、実行しようとすると  
「デジタル署名がされていないので実行できません」と英文で  
表示されますので、署名するか署名を無効にしても実行できる  
ようにしましょう。

署名をすると防犯上は良いのですが、開発段階では手間が  
かかるので、作成者アカウントなら無署名でも実行可に  
すると便利です。

以下のコマンドを入力すると、ローカルで作成した無署名の  
書類は実行できますが、インターネットからダウンロードした  
無署名書類は防犯上、実行できません。

Set-ExecutionPolicy RemoteSigned
