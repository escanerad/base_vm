    #FORÇAR REDIRECCIÓ A HTTPS
    #sudo vi /opt/bitnami/apache2/conf/bitnami/bitnami.conf

    # A LA SECCIÓ <VirtualHost _default_:80> AFEGIR
    # RewriteEngine On
    # RewriteCond %{HTTPS} !=on
    # RewriteRule ^/(.*) https://%{SERVER_NAME}/$1 [R,L]
    sudo cp /opt/bitnami/apache2/conf/bitnami/bitnami.conf /opt/bitnami/apache2/conf/bitnami/bitnami.conf.bak
    sudo sed -i '/\DocumentRoot \"\/opt\/bitnami\/apache2\/htdocs\"/a\  RewriteEngine On' /opt/bitnami/apache2/conf/bitnami/bitnami.conf
    # Eliminar el RewriteEngine de la secció SSL 
    sudo vi /opt/bitnami/apache2/conf/bitnami/bitnami.conf
    sudo sed -i '/\RewriteEngine On/a\  RewriteCond \%\{HTTPS\} \!\=on' /opt/bitnami/apache2/conf/bitnami/bitnami.conf
    sudo sed -i '/\RewriteCond \%{HTTPS} \!\=on/a\  RewriteRule \^\/\(\.\*\) https\:\/\/\%{SERVER\_NAME}\$1 \[R\,L\]' /opt/bitnami/apache2/conf/bitnami/bitnami.conf
    
    #RESTART APACHE SERVICE
    sudo /opt/bitnami/ctlscript.sh restart apache