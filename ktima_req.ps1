param (
    [string]$Variable
)

# Construct the "Message" value by appending the variable to the fixed part
$message = "LookForGPropID|$Variable"

$session = New-Object Microsoft.PowerShell.Commands.WebRequestSession
$cookie = New-Object System.Net.Cookie
$cookie.Name = ".AspNetCore.Antiforgery.OvFV5KRnAAc"
$cookie.Value = "CfDJ8K5j-F2PodhIrJmVGdl7vRRquFaJd8rehOiRg9chQrZe1JMM-9wEY1rfIBtVUvlvaCgA6FVTsavJI4f8Izmu0RRwHNCZKJFzbdWg29n69I9V7RMlZHjD84WvO7ess6ynUNZ3C-7VMKyRDq6wHojWEos"
$cookie.Domain = "maps.gov.gr"
$session.Cookies.Add($cookie)
$headers = @{
    "Accept" = "*/*"
    "Accept-Language" = "el-GR,el;q=0.9,en;q=0.8"
    "DNT" = "1"
    "Origin" = "https://maps.gov.gr"
    "Referer" = "https://maps.gov.gr/gis/map/"
    "RequestVerificationToken" = "CfDJ8K5j-F2PodhIrJmVGdl7vRR_VQrZZs30S9qwZU9yie-Ui00Rfvgl_VGctZjUwJFZzBIkDaJ95-PJt-4KhXkhP8ZOE4F9Fv9xKo167eKk8jKkNT3qqQj4vp14yLTb2n-ZLG5kt2rlkf2FMK10ZOCfCAA"
    "Sec-Fetch-Dest" = "empty"
    "Sec-Fetch-Mode" = "cors"
    "Sec-Fetch-Site" = "same-origin"
    "X-Requested-With" = "XMLHttpRequest"
    "sec-ch-ua" = "`"Chromium`";v=`"118`", `"Google Chrome`";v=`"118`", `"Not=A?Brand`";v=`"99`""
    "sec-ch-ua-mobile" = "?0"
    "sec-ch-ua-platform" = "`"Windows`""
}
$body = @{
    "Message" = $message
}

try {
    $response = Invoke-WebRequest -Uri "https://maps.gov.gr/gis/map/KT/KT__PostHandlerCommon" `
        -Method Post `
        -WebSession $session `
        -Headers $headers `
        -ContentType "application/x-www-form-urlencoded; charset=UTF-8" `
        -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36" `
        -Body $body `
        -TimeoutSec 20

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