#!/bin/sh
echo "[+] Patching httpd.conf to enable alias_module and serve the same content for all requests"
/bin/sed -i -e '/LoadModule alias_module/s/^#//g' -e '/ScriptAlias \/cgi-bin/d' /usr/local/apache2/conf/httpd.conf
/bin/echo 'AliasMatch "^/.+$" /usr/local/apache2/htdocs/index.html' >> /usr/local/apache2/conf/httpd.conf