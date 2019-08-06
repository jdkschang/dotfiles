#!/bin/bash

chown -R http:http /volume1/web/nextcloud/
chown -R http:http /volume1/web/nextcloud/apps/
chown -R http:http /volume1/web/nextcloud/config/
chown -R http:http /volume1/web/nextcloud/themes/
chown -R http:http /volume1/homes/robin/
chown http:http /volume1/web/nextcloud/.htaccess
find /volume1/web/nextcloud/ -type f -print0 | xargs -0 chmod
find /volume1/web/nextcloud/ -type d -print0 | xargs -0 chmod
find /volume1/homes/robin/ -type d -print0 | xargs -0 chmod
chmod 777 /volume1/web/nextcloud/.htaccess
