#!/bin/bash

if [[ -z "${ProxySite}" ]]; then
  s="s/proxy_pass/#proxy_pass/g"
  echo "site:use local wwwroot html"
else
  s="s|\${ProxySite}|${ProxySite}|g"
  echo "site: ${ProxySite}"
fi

sed -e "/^#/d"\
    -e "s/\${PORT}/${PORT}/g"\
    -e "$s"\
    /conf/nginx.template.conf > /etc/nginx/nginx.conf

rm -rf /etc/nginx/sites-enabled/default
nginx -g 'daemon off;'
