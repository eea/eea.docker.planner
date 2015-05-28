FROM ubuntu:14.04.1

MAINTAINER michimau <mauro.michielon@eea.europa.eu>

RUN adduser --disabled-password --gecos "" planner

RUN apt-get -y install apache2 \
    php5-ldap \
    w3m \
    slapd \
    ldap-utils \
    python-ldap

RUN a2enmod proxy proxy_http proxy_ajp rewrite deflate headers proxy_balancer proxy_connect proxy_html authnz_ldap

RUN mkdir /etc/apache2/logs	
RUN mkdir /var/local/www-logs
RUN mkdir /var/local/www-logs/planner
RUN mkdir /var/local/www-logs/planner/access

COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf

RUN ln -s /usr/lib/x86_64-linux-gnu/libldap_r-2.4.so.2 /usr/lib/libldap_r-2.3.so.0
RUN ln -s /usr/lib/x86_64-linux-gnu/liblber-2.4.so.2 /usr/lib/liblber-2.3.so.0
RUN ln -s /lib/x86_64-linux-gnu/libssl.so.1.0.0 /lib/libssl.so.6
RUN ln -s /lib/x86_64-linux-gnu/libcrypto.so.1.0.0 /lib/libcrypto.so.6

RUN chown -R planner ./var
RUN chgrp -R planner ./var
RUN chgrp -R planner ./planner
RUN chown -R planner ./planner
RUN chown planner /var/local/planner/log/event.log
RUN chgrp planner /var/local/planner/log/event.log

CMD apachectl start && /var/local/planner/planner/bin/runzope
