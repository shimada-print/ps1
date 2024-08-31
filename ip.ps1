# IP 情報を取得する関数
function Get-Location {
    $apiUrl = "https://ipinfo.io/json" # IPinfo API の URL
    try {
        $response = Invoke-RestMethod -Uri $apiUrl
        $location = @{
            IP = $response.ip
            City = $response.city
            Region = $response.region
            Country = $response.country
            Location = $response.loc
        }
        return $location
    } catch {
        Write-Error "位置情報を取得できませんでした。"
    }
}

# 位置情報を表示する
$location = Get-Location
if ($location) {
    Write-Output "IP: $($location.IP)"
    Write-Output "City: $($location.City)"
    Write-Output "Region: $($location.Region)"
    Write-Output "Country: $($location.Country)"
    Write-Output "Location (Latitude, Longitude): $($location.Location)"
}

# 上記はChatGPTに書いてもらった
# 下記を入れないと直ぐに消えて見れない

Read-Host -Prompt "Press Enter to exit"
