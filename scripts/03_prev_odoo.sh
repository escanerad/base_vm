#ACCIONS VM ODOO
    #DESACTIVAR BANNER EN PAGINA
    sudo /opt/bitnami/apps/odoo/bnconfig --disable_banner 1
    sudo /opt/bitnami/ctlscript.sh restart apache

    #WKHTMLTOPDF
    wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
    tar -xvf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
    sudo cp ./wkhtmltox/bin/wkhtmltoimage /usr/bin/
    sudo cp ./wkhtmltox/bin/wkhtmltopdf /usr/bin/
    sudo /opt/bitnami/ctlscript.sh restart

#FI ACCIONS VM ODOO