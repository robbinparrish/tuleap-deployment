## Disclaimer.
The content on this account/repository provided solely for educational and informational purposes.
It is not intended for use in making any kind of business, investment and/or legal decisions.
Although every effort has been made to keep the information up-to-date and accurate, no representations and/or warranties, express and/or implied, completeness, accuracy, reliability, suitability, and/or availability of the content.

## Tuleap.
This can be used to setup a Tuleap Community Edition Server.  
Tuleap CE - https://docs.tuleap.org/

For backup of mysql database we will need to create a directory and set the correct ownership.
```bash
mkdir -p ./mysql-db/backups
chown -R 1000:1000 ./mysql-db/backups
```

## Docker Compose Version.
Always validate that [docker-compose](https://github.com/docker/compose/releases/) version is latest.
If not then use the latest released version. As of updating this document `v2.24.0` was latest released version.

### Starting the container.
```bash
docker-compose up -d
```

### Checking the container logs.
```bash
docker-compose logs -f
```

### Once Container is successfully created, we can access the webui in the browser - http://IPADDR_OF_SYSTEM
- Default username and password - admin/admin

`Once logged in to the webui, please reset the password.`

[Additional Configuration](./configs/additional-configs.md)

[Backup and Restore](./configs/backup-and-restore.md)

[Upgrading Tuleap](./configs/upgrading-tuleap.md)

