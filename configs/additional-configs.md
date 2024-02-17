## Additional configuration to perform after deploying the Tuleap server.

### First thing before modifying anything on server is to set the `admin` user password and email address.
- https://docs.tuleap.org/admin.html

```Please note that followings configuration may not be accurate for every deployments. These settings allowed Admin to make sure the Tuleap server is configured with necessary additional configuration.```

## Navigate to the `Admin Setting Panel` for modifying system-wide settings.

### Users Settings.
- All users.
	- Select `admin` user.
		- Configure `Email` address and `Real Name` for admin user.
		- Change `Password`.
- Password policy.
	- Compromised password.
		- `Disable` Block usage of passwords known as compromised. (As this uses external services to determine password we must disable it.)
- User settings.
	- User creation moderation.
		- `Enable` Users must be approved by administrators.

### Projects Settings.
- Project settings.
	- Moderation.
		- Project creation moderation.
			- `Enable` Project must be approved by administrators.

### Plugins Settings.
- Manage all plugins.
	- `Disable` Preinstalled plugins.
		- Continuous Integration for Git plugin
		- Continuous Integration
		- GitLab
		- Pull request
		- Git LFS
		- Git
		- ONLYOFFICE integration
		- MediaWiki Standalone
		- SVN with multiple repositories
- Document.
	- File upload limits.
		- Change `Maximum number of files` to `50`.
		- Change `Maximum files size (in Bytes)` to `268435456` (256 MB).
- OpenID Connect Client.
	- `Delete` default OAuth Client Provider.
	- If requires then `Add Provider`.

	#### Enabling authentication using Gitlab OAuth Application - `NOT TESTED`
	https://docs.gitlab.com/ee/integration/oauth_provider.html

	- Scope - openid, profile, email.
	- OpenID Settings - https://GITLAB_DOMAIN/.well-known/openid-configuration

### Global Configuration Settings.
- Global access rights.
	- Platform access control.
		- `Select` All users must be logged in and restricted users are enabled.
	- Page accessible to anonymous.
		- `Disable` Site homepage.
		- `Disable` Contact (help menu).
- Homepage.
	- `Disable` Display platform statistics on home page.
	- `Disable` Display site news on home page.
