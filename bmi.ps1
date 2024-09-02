# ユーザーに入力してもらう
$weight = [double](Read-Host "体重(kg)を入力してください:")
$height = [double](Read-Host "身長(m)を入力してください:")

# BMIを計算
$bmi = $weight / ($height * $height)

# 結果を表示
Write-Host "あなたのBMIは$bmiです。"

# BMI判定（あくまで目安）
if ($bmi -lt 18.5) {
    Write-Host "低体重です。"
} elseif ($bmi -ge 18.5 -and $bmi -lt 25) {
    Write-Host "普通体重です。"
} elseif ($bmi -ge 25 -and $bmi -lt 30) {
    Write-Host "肥満(Ⅰ度)です。"
} else {
    Write-Host "高度肥満です。"
}

# 押して終了機能を入れないと、見れないほど早く終了してしまう
Read-Host -Prompt "Press Enter to exit"
