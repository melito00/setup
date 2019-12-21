# setup

(gc setup.md) | %{$_.split("`n")} | Out-File setup.txt

# chocolatey

Set-ExecutionPolicy -Scope Process -ExecutionPolicy AllSigned;  iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

Invoke-WebRequest -Uri 'https://ja.osdn.net/frs/redir.php?m=acc&f=%2Fsevenzip%2F66539%2F7z1604-x64.exe' -OutFile 7z1604-x64.exe
.\7z1604-x64.exe /S /D=C:\z\7z

iwr -Uri http://repo.msys2.org/distrib/x86_64/msys2-base-x86_64-20161025.tar.xz -OutFile msys2-base-x64.tar.xz

# Setup Void Linux

curl -L http://tiny.cc/setup-void1 | sh

