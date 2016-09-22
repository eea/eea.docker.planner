#!/bin/sh
if [ -d /opt/Products ]; then
  rm -rf /var/local/website/Products
  mv /opt/Products /var/local/website/
 fi

OWNER="${USERID:-600}"
chown -R "$OWNER" /var/local/website/

/zope-entrypoint.sh