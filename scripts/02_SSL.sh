#CONFIGURACIÓ SSL
    #AFEGIR REPOSITORI A /etc/apt/sources.list
    #deb http://ftp.debian.org/debian stretch-backports main
    sudo apt-get update

    #### SI NO FALLA LA SEGUENT LINIA
    sudo apt-get install certbot -t stretch-backports
        #### SI HA FALLAT LA INSTRUCCIO ANTERIOR
        wget https://cdn-aws.deb.debian.org/debian/pool/main/p/python-acme/python-acme_0.19.0-1~bpo9+1_all.deb
        sudo dpkg -i python-acme_0.19.0-1~bpo9+1_all.deb
        sudo apt -t stretch-backports install -f
        sudo apt -t stretch-backports install python-certbot-apache
    
    #STOP APACHE SERVICE
    sudo /opt/bitnami/ctlscript.sh stop apache
    
    sudo certbot certonly #Mode Standalone domini odoo.saas.escaner.ad

    sudo mv /opt/bitnami/apache2/conf/server.crt /opt/bitnami/apache2/conf/server.crt.old
    sudo mv /opt/bitnami/apache2/conf/server.key /opt/bitnami/apache2/conf/server.key.old
    sudo mv /opt/bitnami/apache2/conf/server.csr /opt/bitnami/apache2/conf/server.csr.old
    sudo ln -s /etc/letsencrypt/live/odoo.saas.escaner.ad/privkey.pem /opt/bitnami/apache2/conf/server.key
    sudo ln -s /etc/letsencrypt/live/odoo.saas.escaner.ad/fullchain.pem /opt/bitnami/apache2/conf/server.crt
    sudo chown root:root /opt/bitnami/apache2/conf/server*
    sudo chmod 600 /opt/bitnami/apache2/conf/server*

    #START APACHE SERVICE
    sudo /opt/bitnami/ctlscript.sh start apache

    #FORÇAR REDIRECCIÓ A HTTPS
    sudo vi /opt/bitnami/apache2/conf/bitnami/bitnami.conf
    # A LA SECCIÓ <VirtualHost _default_:80> AFEGIR
    # RewriteEngine On
    # RewriteCond %{HTTPS} !=on
    # RewriteRule ^/(.*) https://%{SERVER_NAME}/$1 [R,L]

    #RESTART APACHE SERVICE
    sudo /opt/bitnami/ctlscript.sh restart apache
#FI CONFIGURACIÓ SSL