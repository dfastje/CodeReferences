# Code Server Notes

Document setup details, environment variables, and operational tips here.

## Environment Variables

| Variable                   | Dev Value                     | Prod Value                   |
| :------------------------- | :---------------------------- |:-----------------------------|
| `CODE_SERVER_CONFIG_PATH`  | `./docker-volumes/config`     | `~/docker/codeserver_config` |
| `CODE_SERVER_PASSWORD`     | `changeme`                    | -                            |
| `CODE_SERVER_SUDO_PASSWORD`| `changeme`                    | -                            |
| `CODE_SERVER_CERT_DIR`     | `./nginx/ssl/cert`            | `/etc/ssl/certs`             |
| `CODE_SERVER_KEY_DIR`      | `./nginx/ssl/private`         | `/etc/ssl/private`           |
| `CODE_SERVER_CERT_DOMAIN`  | `code-server.local`           | -                            |
| `CODE_SERVER_CERT_DAYS`    | `365`                         | -                            |

## Deployment Commands

```bash
sudo docker compose down && \
sudo docker compose pull && \
sudo docker compose up -d
```

## Documentation

- [LinuxServer.io Code Server Docs](https://docs.linuxserver.io/images/docker-code-server)
- [Code Server Docker Hub Image](https://hub.docker.com/r/linuxserver/code-server)
