#!/bin/bash

# Path where the Tuleap deployment is configured.
# NEED TO REPLACE THEASE TO CORRECT PATH.
TULEAP_DEPLOYMENT_DIR="${HOME}/tuleap-deployment"
TULEAP_DEPLOYMENT_BACKUP_PATH="${HOME}/tuleap-deployment-backup"
MYSQL_DB_PASSWORD="YOUR_MYSQL_DB_PASSWORD"

# Backup directory.
BACKUP_TIME=$(date "+%d%m%Y%H%M%S")
TULEAP_DEPLOYMENT_BACKUP_DIR="${TULEAP_DEPLOYMENT_BACKUP_PATH}/${BACKUP_TIME}"

cd "${TULEAP_DEPLOYMENT_DIR}" || exit 1

# Backup configuration files.
mkdir -p "${TULEAP_DEPLOYMENT_BACKUP_DIR}"
cp -av ./tuleap-data/data/etc ./tuleap-data/data/var/lib/tuleap ./tuleap-data/data/var/lib/gitolite "${TULEAP_DEPLOYMENT_BACKUP_DIR}"/

# Create backup.
mkdir -p ./mysql-db/backups
chown -R 1000:1000 ./mysql-db/backups
docker-compose exec -it mysql-db /usr/bin/mysqldump -u root --password="${MYSQL_DB_PASSWORD}" --all-databases > ./mysql-db/backups/mysql-db-backup.sql
mv -fv ./mysql-db/backups/mysql-db-backup.sql "${TULEAP_DEPLOYMENT_BACKUP_DIR}"/
sync

# Compress the backup.
cd "${TULEAP_DEPLOYMENT_BACKUP_PATH}" || exit 1
tar -cvzf "${BACKUP_TIME}".tar.gz "${BACKUP_TIME}"
rm -rf "${BACKUP_TIME}"
sync
