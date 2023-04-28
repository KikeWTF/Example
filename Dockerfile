FROM httpd:alpine
WORKDIR /usr/local/apache2/htdocs/
COPY ./www /usr/local/apache2/htdocs/
RUN /bin/sed -i -e '/LoadModule alias_module/s/^#//g' -e '/ScriptAlias \/cgi-bin/d' /usr/local/apache2/conf/httpd.conf && \
    /bin/echo 'AliasMatch "^/.+$" /usr/local/apache2/htdocs/index.html' >> /usr/local/apache2/conf/httpd.conf
EXPOSE 80