# Enabling authentication using Gitlab OAuth Application.
Instructions for creating a [GitLab OpenID Connect application](https://docs.gitlab.com/ee/integration/openid_connect_provider.html).

`NOTE - Please replace your corresponding URLs for Tuleap and GitLab instance.`

## Configure the following settings in the OpenID Connect application.
- Name - Tuleap
- Redirect URL -  https://tuleap.mydomain.com/plugins/openidconnectclient/
- Scopes - openid

After saving the application, in the application page we can find Application ID and Secret.

## Add OpenID Connect provider in Tuleap Admin Panel.
- Name - GitLab Login
- Authorization endpoint - https://gitlab.mydomain.com/oauth/authorize
- Token endpoint - https://gitlab.mydomain.com/oauth/token
- User information endpoint - https://gitlab.mydomain.com/oauth/userinfo
- Client ID - Application ID from OpenID Connection application.
- Client Secret - Secret from OpenID Connection application.

## Additional configurations.
- Due to outbound request filtering default communication from `Tuleap` instance to `GitLab` instance will not work for private network range. More info can be found [here](https://docs.tuleap.org/administration-guide/system-administration/filtering-outbound-requests.html).
- To allow this communication please run following -
```bash
docker-compose exec -it tuleap tuleap config-set http_outbound_requests_allow_ranges "IPADDR_OF_GITLAB_INSTANCE/CIDR"
docker-compose restart tuleap
```

Once user login with `GitLab Login` and login is successful then user need to `Register a new account`. Once  registration is completed then `Admin` need to approve the user account so user can login to `Tuleap` using `GitLab Login`.
