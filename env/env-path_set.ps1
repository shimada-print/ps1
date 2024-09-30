Start-Process control sysdm.cpl
Get-ChildItem Env:

# 下記を入れないとクリック起動をするとターミナルが直ぐに消えて見れない
Read-Host -Prompt "Press Enter to exit"
