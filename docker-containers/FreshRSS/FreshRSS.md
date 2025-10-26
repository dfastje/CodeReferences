# FreshRSS Notes

Document setup details, environment variables, and operational tips here.

## Environment Variables

| Variable                  | Dev Value                     | Prod Value                    |
| :------------------------ | :---------------------------- | :---------------------------- |
| `FRESHRSS_CONFIG_PATH`    | `./docker-volumes/config`     | `~/docker/freshrss_config`    |
| `FRESHRSS_CERT_DIR`       | `./nginx/ssl/cert`            | `/etc/ssl/certs`              |
| `FRESHRSS_KEY_DIR`        | `./nginx/ssl/private`         | `/etc/ssl/private`            |
| `FRESHRSS_CERT_DOMAIN`    | `freshrss.local`              | -                              |
| `FRESHRSS_CERT_DAYS`      | `365`                         | -                              |

## Deployment Commands

```bash
sudo docker compose down && \
sudo docker compose pull && \
sudo docker compose up -d
```

## Documentation

- [LinuxServer.io FreshRSS Docs](https://docs.linuxserver.io/images/docker-freshrss)
- [FreshRSS Docker Hub Image](https://hub.docker.com/r/linuxserver/freshrss)
