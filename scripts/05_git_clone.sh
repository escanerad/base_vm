#DIRECTORI TEMPORAL DE CLONATGE
sudo mkdir /home/bitnami/addons
sudo mkdir /home/bitnami/addons/prod
sudo mkdir /home/bitnami/escaner/addons/repo
cd /home/bitnami/escaner/addons/repo
#PRE-REQUISITS
sudo git clone -b 14.0 https://github.com/OCA/community-data-files
sudo cp -r community-data-files/base_bank_from_iban ../prod
sudo git clone -b 14.0 https://github.com/OCA/account-financial-tools
sudo cp -r account-financial-tools/account_asset_management ../prod
sudo git clone -b 14.0 https://github.com/OCA/reporting-engine
sudo cp -r reporting-engine/report_xlsx ../prod
sudo cp -r reporting-engine/report_xlsx_helper ../prod
#LOCALITZACIÓ ESPANYOLA
sudo git clone -b 14.0 https://github.com/OCA/l10n-spain
sudo cp -r l10n-spain/l10n_es_partner* ../prod
sudo cp -r l10n-spain/l10n_es_account_* ../prod

#MÒDUL DE CONTRACTES
sudo git clone -b 14.0 https://github.com/OCA/contract
sudo cp -r contract/contract ../prod/


#TRASPAS AL DIRECTORI D'ADDONS
sudo cp -r /home/bitnami/escanerad/addons/prod/* /bitnami/odoo/addons

#modificar odoo-server.conf perque apunti al directori /opt/bitnami/apps/escaner/addons
#sudo sed -i 's/addons_path/smtp_from \= "'$correu'"/g' /opt/bitnami/apps/odoo/conf/odoo-server.conf
#NO FUNCIONA FER MANUAL sudo sed 
#COPIAR els addons al directori /opt/bitnami/apps/escaner/addons

