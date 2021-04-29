#preparation
'"malicious action completed" | out-file C:\temp\cyb3rdrop-hack-suceeded.txt' | Out-File C:\temp\cyb3rdrop.ps1 -Force


#hack (run in cmd.exe)
<#
C:\wiNDowS\sySTem32\WbEm\WMic.Exe 'prOCESs'   "caLl"    cReATE  "POwERsHeLl -WiNDows HidDEN   iex C:\temp\cyb3rdrop.ps1"
#>