# IP �����擾����֐�
function Get-Location {
    $apiUrl = "https://ipinfo.io/json" # IPinfo API �� URL
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
        Write-Error "�ʒu�����擾�ł��܂���ł����B"
    }
}

# �ʒu����\������
$location = Get-Location
if ($location) {
    Write-Output "IP: $($location.IP)"
    Write-Output "City: $($location.City)"
    Write-Output "Region: $($location.Region)"
    Write-Output "Country: $($location.Country)"
    Write-Output "Location (Latitude, Longitude): $($location.Location)"
}

# ��L��ChatGPT�ɂ����Ă������
# ���L�����Ȃ��ƒ����ɏ����Č���Ȃ�

Read-Host -Prompt "Press Enter to exit"