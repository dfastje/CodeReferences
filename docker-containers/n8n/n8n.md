# n8n Notes

Document setup details, environment variables, and operational tips here.

## Environment Variables

| Variable                   | Dev Value                | Prod Value                 |
| :------------------------- | :----------------------- | :------------------------- |
| `POSTGRES_USER`            | `n8n`                    | -                          |
| `POSTGRES_PASSWORD`        | `changeme`               | -                          |
| `POSTGRES_DB`              | `n8n`                    | -                          |
| `N8N_HOST`                 | `n8n.local`              | -                          |
| `N8N_PORT`                 | `5678`                   | -                          |
| `N8N_PROTOCOL`             | `http`                   | -                          |
| `N8N_HTTPS_PORT`           | `5678`                   | -                          |
| `N8N_BASIC_AUTH_USER`      | `admin`                  | -                          |
| `N8N_BASIC_AUTH_PASSWORD`  | `changeme`               | -                          |
| `TZ`                       | `UTC`                    | -                          |
| `GENERIC_TIMEZONE`         | `UTC`                    | -                          |
| `N8N_CERT_DIR`             | `./nginx/ssl/cert`       | `/etc/ssl/certs`           |
| `N8N_KEY_DIR`              | `./nginx/ssl/private`    | `/etc/ssl/private`         |
| `N8N_CERT_DOMAIN`          | `n8n.ram.dfastje.work`   | -                          |
| `N8N_CERT_DAYS`            | `365`                    | -                          |

## Deployment Commands

```bash
sudo docker compose down && \
sudo docker compose pull && \
sudo docker compose up -d
```

## Documentation

- [n8n Docker Image](https://hub.docker.com/r/n8nio/n8n)
- [n8n Documentation](https://docs.n8n.io/)
