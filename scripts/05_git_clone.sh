#DIRECTORI TEMPORAL DE CLONATGE
sudo mkdir /home/bitnami/addons
sudo mkdir /home/bitnami/addons/prod
sudo mkdir /home/bitnami/escaner/addons/repo
cd /home/bitnami/escaner/addons/repo
#LOCALITZACIÓ ESPANYOLA
sudo git clone -b 14.0 https://github.com/OCA/l10n-spain
sudo cp -r l10n-spain/l10n_es_partner* ../prod
sudo cp -r l10n-spain/l10n_es_account_* ../prod

#MÒDUL DE CONTRACTES
sudo git clone -b 11.0 https://github.com/OCA/contract
sudo cp -r contract/contract ../prod/

#DEPENDENCIES DEL MODUL ANTERIOR
#    sudo git clone -b 10.0 https://github.com/OCA/account-analytic
#    sudo git clone -b 10.0 https://github.com/OCA/account-financial-tools
#    sudo git clone -b 10.0 https://github.com/OCA/bank-payment
#    sudo git clone -b 10.0 https://github.com/OCA/sale-workflow
#    sudo git clone -b 10.0 https://github.com/OCA/web

#TRASPAS AL DIRECTORI D'ADDONS
#sudo mkdir /opt/bitnami/apps/escaner
#sudo mkdir /opt/bitnami/apps/escaner/addons

#modificar odoo-server.conf perque apunti al directori /opt/bitnami/apps/escaner/addons
#sudo sed -i 's/addons_path/smtp_from \= "'$correu'"/g' /opt/bitnami/apps/odoo/conf/odoo-server.conf
#NO FUNCIONA FER MANUAL sudo sed 
#COPIAR els addons al directori /opt/bitnami/apps/escaner/addons

