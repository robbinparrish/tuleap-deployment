# Email Configuration.
We can enable [Email Relay](https://docs.tuleap.org/administration-guide/system-administration/email-relay.html) to allow `Tuleap` to send email using specified SMTP server.


- To allow this communication please run following -
```bash
docker-compose exec -it tuleap tuleap config-set email_transport "smtp"
docker-compose exec -it tuleap tuleap config-set email_relayhost "smtp.mydomain.com:587"
docker-compose exec -it tuleap tuleap config-set email_relayhost_smtp_use_tls "1"
docker-compose exec -it tuleap tuleap config-set email_relayhost_smtp_username "tuleap@tuleap.mydomain.com"
docker-compose exec -it tuleap tuleap config-set email_relayhost_smtp_password "SMTP_PASSWORD"
docker-compose exec -it tuleap tuleap config-set email_relayhost_smtp_auth_type "login"
docker-compose restart tuleap
```

NOTE - Tuleap does not support changing the noreply email address `noreply@tuleap.mydomain.com` using `config-set`, hence it is required to make sure that SMTP server support the different email address in `Send As` email. If SMTP server does not support this then the `noreply` email address must be changed manually.

Modify `./tuleap-data/data/etc/tuleap/conf/local.inc` file.

Change `$sys_noreply = '"Tuleap" <noreply@tuleap.mydomain.com>';`  to  `$sys_noreply = 'tuleap@tuleap.mydomain.com';`
