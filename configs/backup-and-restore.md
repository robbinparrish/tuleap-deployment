## Backup and Restore.
https://docs.tuleap.org/administration-guide/system-administration/backup.html#

### Backup Tuleap instance.
Since Tuleap stores all data in the `mysql` database so we will need to backup the whole database.

All backups are stored in `./mysql-db/backups` directory.  
Along with the backup following directories must be `manually` backed up.  
```
./tuleap-data/data/etc
./tuleap-data/data/var/lib/tuleap
./tuleap-data/data/var/lib/gitolite
```

For backup of mysql database we will need to create a directory and set the correct ownership.
```bash
mkdir -p ./mysql-db/backups
chown -R 1000:1000 ./mysql-db/backups
```

#### Triggering Backup.
Run following command to trigger the backup.
This will create a `.sql` file containing database.
```bash
docker-compose exec -it mysql-db /usr/bin/mysqldump -u root --password=YOUR_MYSQL_DB_PASSWORD --all-databases > ./mysql-db/backups/mysql-db-backup.sql
```

#### Triggering Restore.
Followings conditions must be met for restore.
- A working Tuleap instance.

#### Restore.
- Stop the Tuleap container.
```bash
docker-compose down tuleap
```

- Restore/Copy the configuration files.
```
First remove existing directories.
./tuleap-data/data/etc
./tuleap-data/data/var/lib/tuleap
./tuleap-data/data/var/lib/gitolite

Now copy backed up directories.
Copy etc to ./tuleap-data/data/
Copy tuleap to ./tuleap-data/data/var/lib/tuleap
Copy gitolite to ./tuleap-data/data/var/lib/gitolite
```

- Copy the mysql backup file for restore.
```
Copy mysql-db-backup.sql file to ./mysql-db/backups directory.
```

- Restore the mysql backup.
```bash
docker-compose exec -T mysql-db /usr/bin/mysql -u root --password=YOUR_MYSQL_DB_PASSWORD < ./mysql-db/backups/mysql-db-backup.sql
```

### Stop all the container.
```
docker-compose down
```

### Starting the container.
```
docker-compose up -d
```

### Checking the container logs.
```
docker-compose logs -f
```

#### Once Backup is restored login to the Tuleap instance and verify that all configurations and data are restored.

