# setup

(gc setup.md) | %{$_.split("`n")} | Out-File setup.txt

# chocolatey

Set-ExecutionPolicy -Scope Process -ExecutionPolicy AllSigned;  iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
