param (
    [string]$Variable
)

# Construct the "Message" value by appending the variable to the fixed part
$message = "LookForGPropID|$Variable"

$body = @{
    "Message" = $message
}

$session = New-Object Microsoft.PowerShell.Commands.WebRequestSession
$session.UserAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36"
$session.Cookies.Add((New-Object System.Net.Cookie(".AspNetCore.Antiforgery.OvFV5KRnAAc", "CfDJ8PRpNdCwqcVNmpkXHWjcfvfp2qvZi2sVPuXczAWjNJqkshshaRF9Zau53pSkSLFi1nMuDn5nyL3vsJuBd9tnO2vL4U6vnIHwuJMfK0tJrHTX22HeR4zkWvl6Yos-tRBPbvTBuHUPybXH6OQtMs0KC70", "/", "maps.gov.gr")))
$session.Cookies.Add((New-Object System.Net.Cookie("cookiesession1", "678A3E460F7C0D32C69829E7CBB151B8", "/", "maps.gov.gr")))
try
{
$response = Invoke-WebRequest -Uri "https://maps.gov.gr/gis/map/PostHandler" `
-Method POST `
-WebSession $session `
-Headers @{
"Accept"="*/*"
  "Accept-Encoding"="gzip, deflate, br, zstd"
  "Accept-Language"="en-GB,en-US;q=0.9,en;q=0.8,el;q=0.7"
  "DNT"="1"
  "Origin"="https://maps.gov.gr"
  "Referer"="https://maps.gov.gr/gis/map/"
  "RequestVerificationToken"="CfDJ8PcttteAo_dFgirjhuO2cKk1cjNsypa5aVuX-OjibA8OjAn4-z6IHdQ2MtD0kHwoBjMgJh8YJ2mPLm7Gnp2CDC6fdmtL_UTq9N-mAA69lq0bx0EHcBGEKxDDSl1eOkbl5XNt1ONmRw0ckugjNzgaCV0"
  "Sec-Fetch-Dest"="empty"
  "Sec-Fetch-Mode"="cors"
  "Sec-Fetch-Site"="same-origin"
  "X-Requested-With"="XMLHttpRequest"
  "sec-ch-ua"="`"Google Chrome`";v=`"131`", `"Chromium`";v=`"131`", `"Not_A Brand`";v=`"24`""
  "sec-ch-ua-mobile"="?0"


} `
-ContentType "application/x-www-form-urlencoded; charset=UTF-8" `
-Body $body `
-Timeout 20


# Output the response
    $responseContent = $response.Content
    $responseContent
} catch [System.Management.Automation.PSInvalidOperationException] {
    # Handle timeout
    $responseContent = "timeout"
    $responseContent
} catch {
    # Handle other errors (you can add more specific catch blocks for different exception types if needed)
    $responseContent = "wrongcookie"
    $responseContent
}
