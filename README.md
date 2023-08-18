Discord Feed Notifier
===

Send RSS Feed notify to Discord Server

## Usage

Run `sam build` to prepare lambda function

```bash
sam build --use-container
```

Run `sam deploy` with parameters

```bash
sam deploy --no-confirm-changeset --no-fail-on-empty-changeset --parameter-overrides Webhook=[DISCORD_WEBHOOK_URL]
```

## Parameters

The options to configure notifier

| Name       | Default                            | Description                                                                       |
|------------|------------------------------------|-----------------------------------------------------------------------------------|
| `Schedule` | `cron(0 9 * * ? *)`                | The EventBridge cron job rule                                                     |
| `Timezone` | `Asia/Taipei`                      | The timezone                                                                      |
| `Duration` | `P1D`                              | The ISO8601 duration to filter feeds, `P1D` means 1 day ago when schedule trigger |
| `Feed`     | `https://blog.aotoki.me/index.xml` | The feed url                                                                      |
| `Webhook`  | N/A                                | The webhook url to send to Discord                                                |
