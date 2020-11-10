#!/usr/bin/env bash

# variaveis e password
pass_user='123'
vermelho='\033[0;31m'
verde='\033[0;32m'
amarelo='\033[0;33m'
ciano='\033[0;36m'
fim='\033[0m'
seta='\e[32;1m-->\e[m'

# Tela de boas vindas
clear
echo -e "${seta} ${ciano}Bem vindo a instalação do gnome${fim}"
sleep 2s
clear

# Atualizando os espelhos
echo -e "${seta} ${ciano}Atualizando...${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -Syu --noconfirm
clear

# Instalando pacotes ----------------------------------------------------
echo -e "${seta} ${ciano}Instalando pacotes necessários${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -S arch-wiki-docs arch-wiki-lite alsa-utils grub-customizer archlinux-keyring archlinux-wallpaper bash-completion bluez bluez-utils chrome-gnome-shell cmatrix cronie cups dialog dosfstools efibootmgr git gedit gimp gnome gnome-keyring gnome-tweaks gnupg gst-libav gufw htop libreoffice libreoffice-fresh-pt-br lolcat man-db mtools neofetch os-prober pass rsync speedtest-cli totem ufw unrar xclip xcursor-vanilla-dmz-aa xdg-user-dirs xdg-utils xf86-input-synaptics youtube-dl pulseaudio pulseaudio-bluetooth vim xfce4-terminal wget --noconfirm
clear

# Fontes ----------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando as fontes${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -S ttf-jetbrains-mono ttf-dejavu ttf-hack --noconfirm
clear

# Desinstalando pacotes -------------------------------------------------
echo -e "${seta} ${vermelho}Desinstalando pacotes desnecessários${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -R epiphany malcontent gnome-books gnome-maps gnome-boxes gnome-contacts gnome-music gnome-software gnome-terminal --noconfirm
clear

# YAY -------------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o yay${fim}"
sleep 2s
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
clear

# Downgrade---------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o downgrade${fim}"
sleep 2s
yay -S downgrade --noconfirm
clear

# Virt-manager ----------------------------------------------------------
source virt-manager.sh

# Timeshift ------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o timeshift${fim}"
sleep 2s
yay -S timeshift --noconfirm
clear

# lollypop-stable-git --------------------------------------------------
echo -e "${seta} ${ciano}Instalando o lollypop-stable-git${fim}"
sleep 2s
yay -S lollypop-stable-git kid3-cli --noconfirm
clear

# Hackerman ------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando aircrack-ng e usbutils${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -S aircrack-ng usbutils tcpdump --noconfirm
clear

echo -e "${seta} ${ciano}Instalando o crunch${fim}"
sleep 2s
yay -S crunch --noconfirm
clear

# Firmwares -------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando os${fim} ${amarelo}firmwares warnigs${fim} ${ciano}do archlinux${fim}"
sleep 2s
yay -S aic94xx-firmware wd719x-firmware upd72020x-fw --noconfirm
clear

# Gnome-terminal-transparency -------------------------------------------
echo -e "${seta} ${ciano}Instalando o gnome-terminal-transparency${fim}"
sleep 2s
yay -S gnome-terminal-transparency --noconfirm
clear

# Cava -------------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o cava${fim}"
sleep 2s
yay -S cava --noconfirm
clear

# Ventoy -------------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o ventoy${fim}"
sleep 2s
yay -S ventoy-bin --noconfirm
clear

# Mint-icons ------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o mint-icons${fim}"
sleep 2s
yay -S mint-y-icons --noconfirm
clear

# Sardi-icons ------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o sardi-icons${fim}"
sleep 2s
yay -S sardi-icons --noconfirm
clear

# Ant-dracula-theme-git ------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o ant-dracula-theme-git${fim}"
sleep 2s
yay -S ant-dracula-theme-git --noconfirm
clear

# Debtap ----------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o debtap${fim}"
sleep 2s
yay -S debtap --noconfirm
clear

# Glxinfo ----------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o glxinfo${fim}"
sleep 2s
yay -S glxinfo --noconfirm
clear

# Google-chrome ---------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o google-chrome${fim}"
sleep 2s
yay -S google-chrome --noconfirm
clear

# Spotify ---------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando spotify${fim}"
sleep 2s
yay -S spotify --noconfirm
clear

# Fontes ----------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando as fontes${fim}"
sleep 2s
yay -S ttf-ms-fonts --noconfirm
yay -S ttf-roboto --noconfirm
yay -S ttf-ubuntu-font-family --noconfirm
clear
