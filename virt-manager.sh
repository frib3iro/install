#!/usr/bin/env bash                                                                                                                   

# variaveis e password
pass_user='123'
vermelho='\033[0;31m'
verde='\033[0;32m'
amarelo='\033[0;33m'
ciano='\033[0;36m'
fim='\033[0m'
seta='\e[32;1m-->\e[m'

clear
echo -e "${seta} ${ciano}Instalando os Pacotes Necessários${fim}"
sleep 2s
if echo $pass_user | sudo -S pacman -S qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat --noconfirm
then
    echo -e "${verde}Sucesso!${fim}"
else
    echo -e "${vermelho}Falhou!${fim}"
fi

echo -e "${seta} ${ciano}Instalando o libguestfs${fim}"
sleep 2s
if yay -S libguestfs --noconfirm
then
    echo -e "${verde}Sucesso!${fim}"
else
    echo -e "${vermelho}Falhou!${fim}"
fi

echo -e "${seta} ${ciano}Ativando o Serviço libvirt${fim}"
sleep 2s
if echo $pass_user | sudo -S systemctl enable libvirtd && sudo systemctl start libvirtd
then
    echo -e "${verde}Sucesso!${fim}"
else
    echo -e "${vermelho}Falhou!${fim}"
fi

echo -e "${seta} ${ciano}Habilitando o grupo libvirt${fim}"
sleep 2s
if echo $pass_user | sudo -S sed -i 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/' /etc/libvirt/libvirtd.conf
then
    echo -e "${verde}Sucesso!${fim}"
else
    echo -e "${vermelho}Falhou!${fim}"
fi

echo -e "${seta} ${ciano}Habilitando leitura e escrita para o grupo libvirt${fim}"
sleep 2s
if echo $pass_user | sudo -S sed -i 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/' /etc/libvirt/libvirtd.conf
then
    echo -e "${verde}Sucesso!${fim}"
else
    echo -e "${vermelho}Falhou!${fim}"
fi

echo -e "${seta} ${ciano}Adicionando o usuário ${USER} ao grupo libvirt${fim}"
sleep 2s
if echo $pass_user | sudo -S gpasswd -a $USER libvirt >/dev/null 2>&1
then
    echo -e "${verde}Sucesso!${fim}"
else
    echo -e "${vermelho}Falhou!${fim}"
fi

echo -e "${seta} ${ciano}Reiniciando o serviço${fim}"
sleep 2s
if echo $pass_user | sudo -S systemctl restart libvirtd.service
then
    echo -e "${verde}Sucesso!${fim}"
else
    echo -e "${vermelho}Falhou!${fim}"
fi

echo -e "${seta} ${ciano}Configurando o libvirt para inicializar automaticamente o serviço de rede${fim}"
sleep 2s
if echo $pass_user | sudo -S virsh net-start default && sudo virsh net-autostart --network default
then
    echo -e "${verde}Sucesso!${fim}"
else
    echo -e "${vermelho}Falhou!${fim}"
fi

