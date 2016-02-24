FROM ubuntu:14.04.1

MAINTAINER michimau <mauro.michielon@eea.europa.eu>

RUN adduser --disabled-password --gecos "" planner

RUN apt-get -y install \
    apache2 \
    php5-ldap \
    w3m \
    slapd \
    ldap-utils \
    python-ldap

RUN ln -s /usr/lib/x86_64-linux-gnu/libldap_r-2.4.so.2 /usr/lib/libldap_r-2.3.so.0 
RUN ln -s /usr/lib/x86_64-linux-gnu/liblber-2.4.so.2 /usr/lib/liblber-2.3.so.0 
RUN ln -s /lib/x86_64-linux-gnu/libssl.so.1.0.0 /lib/libssl.so.6 
RUN ln -s /lib/x86_64-linux-gnu/libcrypto.so.1.0.0 /lib/libcrypto.so.6

CMD /var/local/planner/bin/runzope
#CMD /var/local/planner/planner/bin/runzope
