## CONFIGURACIÓ
    #XARXA - OBTENIR INTERFICIE
    iface0=$(ip link show|grep ^[0-9]| grep -v lo|cut -f2 -d":"|sed 's/^[ \t]*//')
    echo Interface: $iface0
    echo ========================
    read -p 'Adreça IP(XXX.XXX.XXX.XXX/XX) :' ipaddress
    read -p 'Porta d´enllaç (Gateway) :' gateway
    read -p 'Servidor de Noms (DNS) :' DNS

    sudo cp /etc/systemd/network/99-dhcp.network /etc/systemd/network/25-wired.network
    sudo sed -i 's/Name=e\*/Name='$iface0'/g' /etc/systemd/network/25-wired.network
    sudo sed -i '\/DHCP/d' /etc/systemd/network/25-wired.network
    sudo sed -i '\/\[Network\]/a\Address\='$ipaddress /etc/systemd/network/25-wired.network
    sudo sed -i '\/Address/a\Gateway\='$gateway /etc/systemd/network/25-wired.network
    sudo sed -i '\/\Gateway/a\DNS\='$DNS /etc/systemd/network/25-wired.network

    #HOSTNAME
    read -p 'Nom complet del servidor (amb domini): ' servidor
    servidorant=$(cat /etc/hostname)
    sudo sed -i 's/'$servidorant'/'$servidor'/g' /etc/hostname

    #RESUM
    echo 'Host: ' $servidor
    echo '====================================='
    echo 'S´ha configurat: ' $iface0
    #echo '@ IP/NM :' $ipaddress
    #echo 'Gateway :' $gateway
    #echo 'DNS     :' $DNS
    echo '====================================='
    echo 'ÉS NECESSARI REINICIAR, PREMI INTRO'
    read ok

    #REINICIAR
    #sudo init 6