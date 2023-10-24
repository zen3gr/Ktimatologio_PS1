https://stackoverflow.com/questions/33205298/how-to-use-powershell-to-download-a-script-file-then-execute-it-with-passing-in


. { iwr -useb https://raw.githubusercontent.com/zen3gr/Ktimatologio_PS1/main/ktima_req.ps1 } | iex; ktima_req -Variable "171401403205"