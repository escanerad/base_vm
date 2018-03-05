#ACCIONS VM ODOO
    #DESACTIVAR BANNER EN PAGINA
    sudo /opt/bitnami/apps/odoo/bnconfig --disable_banner 1
    sudo /opt/bitnami/ctlscript.sh restart apache

    #WKHTMLTOPDF
    #Instalar dependencies prèvies
    sudo apt-get install wkhtmltopdf
    #Descarregar versió funcional
    wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
    tar -xvf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
    sudo cp ./wkhtmltox/bin/wkhtmltoimage /usr/bin/
    sudo cp ./wkhtmltox/bin/wkhtmltopdf /usr/bin/
    sudo /opt/bitnami/ctlscript.sh restart

    #Instalar font BreuerText
    sudo mkdir /usr/share/fonts/truetype/breuertext
    sudo cp /home/bitnami/base_VM/fonts/Breuer* /usr/share/fonts/truetype/breuertext
    echo 'FONTS INSTALADES'

#FI ACCIONS VM ODOO