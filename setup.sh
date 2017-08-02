#!/bin/sh

cd $HOME

echo "Starting initial setup..."

echo ""
echo "Starting package install ..."
echo ""

curl_installed=`dpkg-query -f'${Status}' --show curl | cut -d ' ' -f 3`
echo $curl_installed
if [ ! "x$curl_installed" = "xintalled" ]; then
  sudo apt-get install --force-yes --yes -quiet=2 curl
fi

curl -sL --proto-redir -all,https https://raw.githubusercontent.com/melito00/setup/master/packages.txt | xargs sudo apt-get install --force-yes --yes --quiet=2

git config --global user.email "kenji.yamada@gmail.com"
git config --global user.name "Kenji Yamada"

git clone git@bitbucket.org:melito/dotfiles.git
sh $HOME/dotfiles/setup.sh

chsh -s /bin/zsh
