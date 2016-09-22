FROM eeacms/zope-2-7-3:latest

RUN yum install -y subversion \
 && mkdir -p /var/local/website \
 && mv /entrypoint.sh /zope-entrypoint.sh \
 && yum clean all \
 && svn co https://svn.eionet.europa.eu/repositories/Zope/bundles/EionetPlanner/trunk/ /opt/Products

ADD entrypoint.sh /