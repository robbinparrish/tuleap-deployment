# Perform an automatic backup of Tuleap Deployment.

## Copy backup script.
```bash
cp -a tuleap-deployment-backup.sh /usr/bin/
chmod +x /usr/bin/tuleap-deployment-backup.sh
```

## Update the configuration path in the backup script.
Update following in `/usr/bin/tuleap-deployment-backup.sh`
```
TULEAP_DEPLOYMENT_DIR="${HOME}/tuleap-deployment"
TULEAP_DEPLOYMENT_BACKUP_PATH="${HOME}/tuleap-deployment-backup"
MYSQL_DB_PASSWORD="YOUR_MYSQL_DB_PASSWORD"
```

## Copy systemd unit and timer files.
```bash
cp tuleap-deployment-backup.timer tuleap-deployment-backup.service /etc/systemd/system/
```

## Enable the timer.
```bash
systemctl daemon-reload
systemctl enable tuleap-deployment-backup.timer
```