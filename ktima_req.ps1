param (
    [string]$Variable
)

# Construct the "Message" value by appending the variable to the fixed part
$message = "LookForGPropID|$Variable"

$body = @{
    "Message" = $message
}

$session = New-Object Microsoft.PowerShell.Commands.WebRequestSession
$session.UserAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36"
$session.Cookies.Add((New-Object System.Net.Cookie(".AspNetCore.Antiforgery.OvFV5KRnAAc", "CfDJ8OSBp992T1dLoV-idSwOs9fMjJZaRLVdgp4pYCYl5vD4TIyS6QGvFBLVm_srkwgVC5pR7iGH-bvBL40zFErkmW1kX521gWgfqsMY6iMooOZcR9xIF2RI1BMb3y_0z1BOM2O0VM1vatv5rtGTcNuAubs", "/", "maps.gov.gr")))
$session.Cookies.Add((New-Object System.Net.Cookie("cookiesession1", "678A3E46A0B24D9D26D504DC967435F8", "/", "maps.gov.gr")))
try
{
$response = Invoke-WebRequest -Uri "https://maps.gov.gr/gis/map/KT/KT__PostHandlerCommon" `
-Method POST `
-WebSession $session `
-Headers @{
"Accept"="*/*"
  "Accept-Encoding"="gzip, deflate, br, zstd"
  "Accept-Language"="en-GB,en;q=0.9"
  "DNT"="1"
  "Origin"="https://maps.gov.gr"
  "Referer"="https://maps.gov.gr/gis/map/"
  "RequestVerificationToken"="CfDJ8OSBp992T1dLoV-idSwOs9foel5n6jHR8lF7oooa3uwMLeOmWc_EG12t7b8UVrR1AINO3YN4h2_I2d-hIFY_Wq1R-xyksWj-D3uick8dbzSSsLFBA6Cn9-KOrJJSqcS6Ph_G7LgQUalmr6XPKS_LLZM"
  "Sec-Fetch-Dest"="empty"
  "Sec-Fetch-Mode"="cors"
  "Sec-Fetch-Site"="same-origin"
  "X-Requested-With"="XMLHttpRequest"
  "sec-ch-ua"="`"Chromium`";v=`"122`", `"Not(A:Brand`";v=`"24`", `"Google Chrome`";v=`"122`""
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