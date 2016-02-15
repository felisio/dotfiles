#!/bin/bash

# Script para desenvolvedores web no Ubuntu
# Criado por Front End Team Senai - Cimatec

# Esse script foi escrito usando o zenity e tem
# o objetivo de agilizar a instalação de programas

zenity --info --title "Script Web Development" --text "Este é um script para instalação de ferramentas úteis para Desenvolvimento Front End e do ambiente do Elementary OS. \n\nCriado por: Front End Team - Senai Cimatec"

resposta=$(zenity  --list  --text "Escolha os pacotes que deseja instalar." --checklist  --column "Instalar" --column "Id" --column "Pacote"\
    FALSE "a" "Restricted-Extras (Codecs de áudio e vídeo, plugin flash, java entre outros)"\
    FALSE "b" "Gimp (Editor de Imagens)"\
    FALSE "c" "Inkscape (Editor de Vetores)"\
    FALSE "d" "Imagemagick (Editor de Imagens via Terminal)"\
    FALSE "e" "Terminator"\
    FALSE "f" "Sublime Text 3"\
    FALSE "g" "Atom"\
    FALSE "h" "Dropbox"\
    FALSE "i" "Google Chromium"\
    FALSE "j" "Google Chrome /java8 "\
    FALSE "l" "Git e Gitk"\
    FALSE "m" "Filezilla"\
    FALSE "n" "Office 4"\
    FALSE "o" "Pip, Virtualenv e Virtualenvwrapper"\
    FALSE "p" "RVM e Ruby"\
    FALSE "q" "Spotify / Skype"\
    FALSE "r" "Thunderbird"\
    FALSE "x" "Extras for Elementary OS"\
    FALSE "z" "NodeJS / Yo / Gulp / Bower (Requer NodeJS) / Webpack / Nodemon"\
    --separator=":" --width=750 --height=700)


if [[ $resposta =~ "a" ]]; then
    sudo apt-get -y install ubuntu-restricted-extras
fi


if [[ $resposta =~ "b" ]]; then
    sudo apt-get -y install gimp
fi

if [[ $resposta =~ "c" ]]; then
    sudo apt-get -y install inkscape
fi

if [[ $resposta =~ "d" ]]; then
   sudo apt-get -y install imagemagick
fi

if [[ $resposta =~ "e" ]]; then
    sudo add-apt-repository -y ppa:gnome-terminator
    sudo apt-get update
    sudo apt-get install terminator
fi

if [[ $resposta =~ "f" ]]; then
  # adicionando repositório
  sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
  sudo apt-get update
  sudo apt-get -y install sublime-text-installer
fi

if [[ $resposta =~ "g" ]]; then
  # adicionando atom editor
  sudo add-apt-repository -y ppa:webupd8team/atom
  sudo apt-get update
  sudo apt-get -y install atom
fi

if [[ $resposta =~ "h" ]]; then
   sudo apt-get -y install nautilus-dropbox
   #instalando indicador da barra de tarefas
   sudo apt-get -y install libappindicator1
fi


if [[ $resposta =~ "i" ]]; then
   sudo apt-get -y install chromium-browser
fi

if [[ $resposta =~ "j" ]]; then
  # baixando a chave do chrome para adicionar nas chaves de repositórios
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  # adicionando na lista de fontes
  sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
  sudo apt-get update
  sudo apt-get install -y google-chrome-stable
  
  #Java8
  sudo add-apt-repository ppa:webupd8team/java
  sudo apt-get update
  sudo apt-get install oracle-java8-installer
fi

if [[ $resposta =~ "l" ]]; then
  sudo apt-get install -y git-core gitk
fi

if [[ $resposta =~ "m" ]]; then
  sudo apt-get install -y filezilla
fi

if [[ $resposta =~ "n" ]]; then
  # instalando dependências
  sudo apt-get install -y python-software-properties python g++ make
  #Install Libre Office 4
  sudo add-apt-repository ppa:libreoffice/libreoffice-4-0
  sudo apt-get update
  sudo apt-get install libreoffice
fi

if [[ $resposta =~ "o" ]]; then
    sudo apt-get install -y curl
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    curl -sSL https://get.rvm.io | bash -s stable
fi

if [[ $resposta =~ "p" ]]; then
  sudo apt-get install -y python-pip
  sudo pip install virtualenv
  sudo pip install virtualenvwrapper
fi

if [[ $resposta =~ "q" ]]; then
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
  echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
  sudo apt-get update
  sudo apt-get install -y spotify-client
  #Install Skype
  sudo apt-add-repository "deb http://archive.canonical.com/ubuntu/ precise partner"
  sudo apt-get update && sudo apt-get install skype
fi

if [[ $resposta =~ "r" ]]; then
  #Install Thunderbird
  #if you want install Thunderbird instead of Geary Mail
  #first remove Geary Mail
  sudo apt-get purge geary

  sudo add-apt-repository ppa:ubuntu-mozilla-security/ppa
  sudo apt-get update
  sudo apt-get install thunderbird
fi

if [[ $resposta =~ "x" ]]; then
  #Install Elementary OS extras
  sudo apt-add-repository ppa:versable/elementary-update
  sudo apt-get update
  sudo apt-get install wingpanel-slim indicator-synapse
  #instalando Tweaks
  sudo add-apt-repository ppa:mpstark/elementary-tweaks-daily
  sudo apt-get update
  sudo apt-get install elementary-tweaks 
  #instalando tema numix
  sudo add-apt-repository ppa:numix/ppa
  sudo apt-get update
  sudo apt-get install numix-gtk-theme numix-icon-theme numix-icon-theme-circle numix-plank-theme 
  #instalando outros temas
  sudo apt-get install elementary-dark-theme elementary-plastico-theme elementary-whit-e-theme elementary-harvey-theme
  sudo apt-get install elementary-elfaenza-icons elementary-nitrux-icons
  sudo apt-get install elementary-plank-themes
fi

if [[ $resposta =~ "z" ]]; then

  # adicionando repositório
  curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
  sudo apt-get update
  sudo apt-get install -y nodejs

  #caso comando de cima não funcionar
  #VERSION=$(zenity --entry --title="Versão Node" --text="Digite a versão do Node:" --entry-text="v5.4.1")
  #sudo su
  #apt-get install -y build-essential
  #git clone https://github.com/nodejs/node && cd node
  #git checkout tags/$VERSION
  #./configure
  #make -j8 && make install

  #instalando defaults
  npm install -g yo gulp
  npm install -g bower
  npm install -g babel-cli webpack
fi


# removendo os pacotes não necessários
sudo apt-get autoremove

zenity --info --title "Instalação Finalizada" --text "Instalação Finalizada com sucesso!"
