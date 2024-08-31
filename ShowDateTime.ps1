Add-Type -AssemblyName System.Windows.Forms

# ウィンドウの設定
$form = New-Object System.Windows.Forms.Form
$form.Text = "現在の日時"
$form.Width = 300
$form.Height = 100
$form.StartPosition = "CenterScreen"

# ラベルの設定
$label = New-Object System.Windows.Forms.Label
$label.Width = 280
$label.Height = 40
$label.Location = New-Object System.Drawing.Point(10, 10)
$label.Font = New-Object System.Drawing.Font("Arial", 14, [System.Drawing.FontStyle]::Bold)
$form.Controls.Add($label)

# タイマーの設定 (1秒ごとに現在の日時を更新)
$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 1000
$timer.Add_Tick({
    $label.Text = (Get-Date).ToString("yyyy/MM/dd HH:mm:ss")
})
$timer.Start()

# フォームの表示
$form.Add_Shown({ $form.Activate() })
[void]$form.ShowDialog()

# 上記はChatGPTに書いてもらった
# 下記を入れないと直ぐに消えて見れない

Read-Host -Prompt "Press Enter to exit"
