# ���[�U�[�ɓ��͂��Ă��炤
$weight = [double](Read-Host "�̏d(kg)����͂��Ă�������:")
$height = [double](Read-Host "�g��(m)����͂��Ă�������:")

# BMI���v�Z
$bmi = $weight / ($height * $height)

# ���ʂ�\��
Write-Host "���Ȃ���BMI��$bmi�ł��B"

# BMI����i�����܂Ŗڈ��j
if ($bmi -lt 18.5) {
    Write-Host "��̏d�ł��B"
} elseif ($bmi -ge 18.5 -and $bmi -lt 25) {
    Write-Host "���ʑ̏d�ł��B"
} elseif ($bmi -ge 25 -and $bmi -lt 30) {
    Write-Host "�얞(�T�x)�ł��B"
} else {
    Write-Host "���x�얞�ł��B"
}

Read-Host -Prompt "Press Enter to exit"