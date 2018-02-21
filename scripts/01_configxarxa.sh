## CONFIGURACIÓ
    #XARXA - OBTENIR INTERFICIE
    iface0=$(ip link show|grep ^[0-9]| grep -v lo|cut -f2 -d":"|sed 's/^[ \t]*//')
    echo Interface: $iface0
    echo ========================
    read -p 'Adreça IP(XXX.XXX.XXX.XXX/XX) :' ipaddress
    read -p 'Porta d´enllaç (Gateway) :' gateway
    read -p 'Servidor de Noms (DNS) :' DNS
    
    #sudo touch /etc/systemd/network/25-wired.network
    #echo [MATCH] >> /etc/systemd/network/25-wired.network
    #echo Name=$iface0  >> /etc/systemd/network/25-wired.network
    #echo  >> /etc/systemd/network/25-wired.network
    #echo [Network]  >> /etc/systemd/network/25-wired.network
    #echo Address=$ipaddress  >> /etc/systemd/network/25-wired.network
    #echo Gateway=$gateway  >> /etc/systemd/network/25-wired.network
    #echo DNS=$DNS  >> /etc/systemd/network/25-wired.network

    #HOSTNAME
    read -p 'Nom complet del servidor (amb domini): ' servidor
    servidorant=$(cat /etc/hostname)
    sudo sed -i 's/'$servidorant'/'$servidor'/g' /etc/hostname

    #RESUM
    echo 'Host: ' $servidor
    echo '====================================='
    echo 'S´ha configurat: ' $iface0
    echo '@ IP/NM :' $ipaddress
    echo 'Gateway :' $gateway
    echo 'DNS     :' $DNS
    echo '====================================='
    echo 'ÉS NECESSARI REINICIAR, PREMI INTRO'
    read ok

    #REINICIAR
    sudo init 6