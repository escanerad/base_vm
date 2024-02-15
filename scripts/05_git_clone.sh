#DIRECTORI TEMPORAL DE CLONATGE
sudo mkdir /home/bitnami/escaner/addons
sudo mkdir /home/bitnami/escaner/addons/prod
sudo mkdir /home/bitnami/escaner/addons/repo
cd /home/bitnami/escaner/addons/repo
#PRE-REQUISITS
sudo git clone -b 16.0 https://github.com/OCA/community-data-files
sudo cp -r community-data-files/base_bank_from_iban ../prod
sudo git clone -b 16.0 https://github.com/OCA/account-financial-tools
sudo cp -r account-financial-tools/account_asset_management ../prod
sudo git clone -b 16.0 https://github.com/OCA/account-financial-reporting
sudo cp -r account-financial-reporting/account_financial_report ../prod
sudo git clone -b 16.0 https://github.com/OCA/account-invoice-reporting
sudo cp -r account-invoice-reporting/account_invoice_report_due_list ../prod
sudo git clone -b 16.0 https://github.com/OCA/account-invoicing
sudo cp -r account-invoicing/account_invoice_tax_note ../prod
sudo cp -r account-invoicing/account_invoice_tax_required ../prod
sudo git clone -b 16.0 https://github.com/OCA/reporting-engine
sudo cp -r reporting-engine/report_xlsx ../prod
sudo cp -r reporting-engine/report_xlsx_helper ../prod
sudo git clone -b 16.0 https://github.com/OCA/mis-builder
sudo cp -r mis-builder/mis_builder .. /prod

#LOCALITZACIÓ ESPANYOLA
sudo git clone -b 16.0 https://github.com/OCA/l10n-spain
sudo cp -r l10n-spain/l10n_es_partner* ../prod
sudo cp -r l10n-spain/l10n_es_account_* ../prod
sudo cp -r l10n-spain/l10n_es_mis_report ../prod
sudo cp -r l10n-spain/l10n_es_aeat ../prod
sudo cp -r l10n-spain/l10n_es_aeat_mod303 ../prod
sudo cp -r l10n-spain/l10n_es_aeat_mod390 ../prod

#MÒDUL DE CONTRACTES
sudo git clone -b 16.0 https://github.com/OCA/contract
sudo cp -r contract/contract ../prod/
sudo cp -r contract/contract_invoice_start_end_dates ../prod/
sudo cp -r contract/contract_payment_mode ../prod/
sudo cp -r contract/agreement_legal ../prod/

#TRASPAS AL DIRECTORI D'ADDONS
sudo cp -r /home/bitnami/escaner/addons/prod/* opt/escaner/odoo/addons

#modificar odoo-server.conf perque apunti al directori /opt/bitnami/apps/escaner/addons
echo "Modificar fitxer odoo.conf => /home/bitnami/escaner/addons/prod"
#sudo sed -i 's/addons_path/smtp_from \= "'$correu'"/g' /opt/bitnami/apps/odoo/conf/odoo-server.conf
#NO FUNCIONA FER MANUAL sudo sed 
#COPIAR els addons al directori /opt/bitnami/apps/escaner/addons