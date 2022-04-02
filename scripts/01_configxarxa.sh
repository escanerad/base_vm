## CONFIGURACIÓ
    #XARXA - OBTENIR INTERFICIE
    iface0=$(ip link show|grep ^[0-9]| grep -v lo|cut -f2 -d":"|grep 3 |sed 's/^[ \t]*//')
    iface1=$(ip link show|grep ^[0-9]| grep -v lo|cut -f2 -d":"|grep 8 |sed 's/^[ \t]*//')
    echo Interface: $iface0
    echo ========================
    read -p 'Adreça IP(XXX.XXX.XXX.XXX/XX) :' ipaddress
    
    #CONFIGURAR XARXA SERVIDORS
    sudo cp /etc/systemd/network/99-dhcp.network /etc/systemd/network/25-wired.network
    sudo sed -i 's/Name=e\*/Name='$iface0'/g' /etc/systemd/network/25-wired.network
    sudo sed -i '\/DHCP/d' /etc/systemd/network/25-wired.network
    sudo sed -i '\/\[Network\]/a\Address\='$ipaddress /etc/systemd/network/25-wired.network
    #CONFIGURAR INTERFICIE NAT PER ACCES A INTERNET
    sudo cp /etc/systemd/network/99-dhcp.network /etc/systemd/network/26-nat.network
    sudo sed -i 's/Name=e\*/Name='$iface1'/g' /etc/systemd/network/26-nat.network

    sudo mv /etc/systemd/network/99-dhcp.network /etc/systemd/network/bak.99-dhcp.network
    
    #HOSTNAME
    read -p 'Nom complet del servidor (amb domini): ' servidor
    servidorant=$(cat /etc/hostname)
    sudo sed -i 's/'$servidorant'/'$servidor'/g' /etc/hostname

    #RESUM
    echo 'Host: ' $servidor
    echo '====================================='
    echo 'S´ha configurat: ' $iface0
    echo '@ IP/NM :' $ipaddress
    echo 'S´ha configurat: ' $iface1
    echo '====================================='
    echo 'ÉS NECESSARI REINICIAR, PREMI INTRO'
    echo '====================================='
    read ok

    #REINICIAR
    #sudo init 6