    # ACcions configurar correu electrònic
    read -p 'Adreça de correu sortint: ' correu
    read -p 'Descripció en correu: ' descripcio
    sudo cp /opt/bitnami/apps/odoo/lib/odoo-10.*.egg/odoo/addons/mail/models/mail_mail.py /opt/bitnami/apps/odoo/lib/odoo-10.*.egg/odoo/addons/mail/models/mail_mail.py.bak
    sudo sed -i 's/email_from\=mail\.email_from/email_from\="'$descripcio' <'$correu'>/g' /opt/bitnami/apps/odoo/lib/odoo-10.*.egg/odoo/addons/mail/models/mail_mail.py
    sudo cp /opt/bitnami/apps/odoo/lib/odoo-10.*.egg/odoo/addons/base/ir/ir_mail_server.py /opt/bitnami/apps/odoo/lib/odoo-10.*.egg/odoo/addons/base/ir/ir_mail_server.py.bak
    sudo sed -i 's/smtp_from \= from_rfc2822\[\-1\]/smtp_from \= "'$correu'"/g' /opt/bitnami/apps/odoo/lib/odoo-10.*.egg/odoo/addons/base/ir/ir_mail_server.py

