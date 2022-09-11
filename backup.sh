#!/bin/bash
# vim: sw=4: ts=4: et


HERE="$(dirname "$(readlink -f "$0")")"

TS="$(date +'%Y-%m-%d_%H-%M-%S')"
BKUP_DIR="$HERE/backup/$TS"

echo "Creating backup: $TS"

mkdir -p "$BKUP_DIR"



docker run --rm -e USER_ID="$(id -u)" -e GROUP_ID="$(id -g)" \
        -v docker-partkeepr_mysql-data:/var/lib/mysql \
        -v $BKUP_DIR:/backup ubuntu \
    bash -c "tar -cvzf /backup/backup_database.tar.gz /var/lib/mysql && chown \$USER_ID:\$GROUP_ID /backup/backup_database.tar.gz"


docker run --rm -e USER_ID="$(id -u)" -e GROUP_ID="$(id -g)" \
        -v docker-partkeepr_partkeepr-conf:/var/www/html/app/config \
        -v docker-partkeepr_partkeepr-data:/var/www/html/data \
        -v docker-partkeepr_partkeepr-web:/var/www/html/web \
        -v $BKUP_DIR:/backup ubuntu \
    bash -c "tar -cvzf /backup/backup_partkeepr.tar.gz  /var/www/html/app/config /var/www/html/data /var/www/html/web  && chown \$USER_ID:\$GROUP_ID /backup/backup_partkeepr.tar.gz"


