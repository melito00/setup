# setup

(gc setup.md) | %{$_.split("`n")} | Out-File setup.txt

# Repository

dotfiles :: git clone git@bitbucket.org:melito/dotfiles.git
scribbles :: git@github.com:melito00/scribbles.git
some-of-templates :: git@github.com:melito00/some-of-templates.git
setup :: git@github.com:melito00/setup.git
memo-rep :: git clone git@bitbucket.org:melito/memo-rep.git

# Tools

## Windows

- curl.exe --silent -LO https://raw.githubusercontent.com/melito00/setup/master/gh-latest-release.ps1

# App Package List

Windows :: curl.exe --silent -LO https://raw.githubusercontent.com/melito00/setup/master/packages-win.txt

# chocolatey

Set-ExecutionPolicy -Scope Process -ExecutionPolicy AllSigned;  iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

Invoke-WebRequest -Uri 'https://ja.osdn.net/frs/redir.php?m=acc&f=%2Fsevenzip%2F66539%2F7z1604-x64.exe' -OutFile 7z1604-x64.exe
.\7z1604-x64.exe /S /D=C:\z\7z

# Setup Void Linux


