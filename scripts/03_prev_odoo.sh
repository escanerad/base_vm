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
    sudo cp /home/bitnami/base_VM/fonts/BreuerText/*.ttf /usr/share/fonts/truetype/breuertext/

    #Treure banner de la consola
    #sudo mv /opt/bitnami/var/data /opt/bitnami/var/data_original
    #sudo mv /opt/bitnami/scripts/init/welcome_message /opt/bitnami/scripts/init/welcome_message_original
    #sudo mv /opt/bitnami/scripts/init/welcome_message_reload /opt/bitnami/scripts/init/welcome_message__reload_original
    #sudo mv /opt/bitnami/scripts/init/update_welcome_file /opt/bitnami/scripts/init/update_welcome_file_original


    # Accions configurar correu electrònic
    #read -p 'Adreça de correu sortint: ' correu
    #read -p 'Descripció en correu: ' descripcio
    #sudo cp /opt/bitnami/apps/odoo/odoo-10.*.egg/addons/mail/models/mail_mail.py /opt/bitnami/apps/odoo/odoo-10.*.egg/addons/mail/models/mail_mail.py.bak
    #sudo sed -i 's/email_from\=mail\.email_from/email_from\="'$descripcio' <'$correu'>/g' /opt/bitnami/apps/odoo/odoo-10.*.egg/addons/mail/models/mail_mail.py

    #UnicodeCSV
    sudo pip install -e git://github.com/jdunck/python-unicodecsv.git#egg=unicodecsv
#FI ACCIONS VM ODOO