Add-Type -AssemblyName System.Windows.Forms

# �E�B���h�E�̐ݒ�
$form = New-Object System.Windows.Forms.Form
$form.Text = "���݂̓���"
$form.Width = 300
$form.Height = 100
$form.StartPosition = "CenterScreen"

# ���x���̐ݒ�
$label = New-Object System.Windows.Forms.Label
$label.Width = 280
$label.Height = 40
$label.Location = New-Object System.Drawing.Point(10, 10)
$label.Font = New-Object System.Drawing.Font("Arial", 14, [System.Drawing.FontStyle]::Bold)
$form.Controls.Add($label)

# �^�C�}�[�̐ݒ� (1�b���ƂɌ��݂̓������X�V)
$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 1000
$timer.Add_Tick({
    $label.Text = (Get-Date).ToString("yyyy/MM/dd HH:mm:ss")
})
$timer.Start()

# �t�H�[���̕\��
$form.Add_Shown({ $form.Activate() })
[void]$form.ShowDialog()

# ��L��ChatGPT�����Ă������
# ���L�����Ȃ��ƒ����ɏ����Č���Ȃ�

Read-Host -Prompt "Press Enter to exit"
