#DIRECTORI TEMPORAL DE CLONATGE
sudo mkdir /home/bitnami/addonrepo
cd /home/bitnami/addonrepo
#LOCALITZACIÓ ESPANYOLA
sudo git clone -b 10.0 https://github.com/OCA/l10n-spain
#DEPENDENCIES

#MÒDUL DE CONTRACTES
sudo git clone -b 10.0 https://github.com/OCA/contract
#DEPENDENCIES DEL MODUL ANTERIOR
    sudo git clone -b 10.0 https://github.com/OCA/account-analytic
    sudo git clone -b 10.0 https://github.com/OCA/account-financial-tools
    sudo git clone -b 10.0 https://github.com/OCA/bank-payment
    sudo git clone -b 10.0 https://github.com/OCA/sale-workflow
    sudo git clone -b 10.0 https://github.com/OCA/web

#TRASPAS AL DIRECTORI D'ADDONS
sudo mkdir /opt/bitnami/apps/escaner
sudo mkdir /opt/bitnami/apps/escaner/addons

#modificar odoo-server.conf perque apunti al directori /opt/bitnami/apps/escaner/addons
#NO FUNCIONA FER MANUAL sudo sed 
#COPIAR els addons al directori /opt/bitnami/apps/escaner/addons

