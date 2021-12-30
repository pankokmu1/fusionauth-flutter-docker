# Flutter AppAuth + FusionAuth + Docker

Project developed to reproduce a bug of the Flutter AppAuth plugin. All data for this project is not real. All project keys were randomly generated on the Internet.

---

### Initialize the project:

To start, clone the repository, cd to it and run the command below.

```bash
docker-compose up -d --build
```

---

### Description of container ports:

- **9011** Used for **FusionAuth**.
- **5432** Used by **Postgres**.

---

### How to access **FusionAuth** Dashboard:

After initializing the containers, access http://localhost:9011 with username: `lima@jhordan.com` and password: `jhordan123` to access FusionAuth dashboard.

---

### Demonstrating the bug:

After initializing the containers, build the flutter application and try to authenticate with FusionAuth. Note that FusionAuth is serving as an identity provider for other services. An error like the example below is expected.

```dart
PlatformException (PlatformException(authorize_and_exchange_code_failed, Failed to authorize: [error: null, description: Invalid ID Token], Issuer host can not be empty, null))
```

To bypass this error, uncomment the `serviceConfiguration` parameter inside the `authorizeAndExchangeCode` method.

However, when using other identity providers, the error does not happen, for example, if we overwrite the test parameters with the example below:

```dart
final result = await appAuth.authorizeAndExchangeCode(
    AuthorizationTokenRequest(
        'interactive.public',
        'com.example.loginsso://oauth2',
        issuer: 'https://demo.identityserver.io',
        scopes: ['openid', 'profile', 'email', 'api', 'offline_access'],
        promptValues: ['login'],
        loginHint: 'bob',
    ),
);
```
