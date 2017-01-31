FROM httpd:2.4

ADD conf /usr/local/apache2/conf
ADD docker-entrypoint.sh /usr/local/apache2/docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]
