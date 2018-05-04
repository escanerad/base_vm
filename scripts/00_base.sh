    #PERSONALITZACIONS S.O.
        #CANVIAR TECLAT A ESPAÑOL
        sudo apt-get install console-setup keyboard-configuration
    
        #ACTIVAR ACPI   
        sudo apt-get install acpi-support-base 
        
        #AFEGIR REPOSITORIS
        # PER TEMES DE CERTBOT - SSL
        sudo echo "deb http://ftp.debian.org/debian stretch-backports main" >> /etc/apt/sources.list
        sudo apt-get update

    ## PERSONALITZACIONS BITNAMI -> ESCANER
        #CANVIAR IMATGE D'INICI
        sudo cp ../imatges/splash.png /boot/grub/
        sudo update-grub

        #DESACTIVAR BANNER EN PAGINA
        sudo /opt/bitnami/apps/odoo/bnconfig --disable_banner 1
        sudo /opt/bitnami/ctlscript.sh restart apache

        sudo rm /home/bitnami/change-password.sh
        
    #echo '====================================='
    #echo 'ÉS NECESSARI REINICIAR, PREMI INTRO'
    #echo '====================================='
    #read ok

    #REINICIAR
    #sudo init 6
    
