# Ollama Notes

Document setup details, environment variables, and operational tips here.

## Environment Variables

| Variable                | Dev Value                    | Prod Value                    |
| :---------------------- |:-----------------------------|:------------------------------|
| `OLLAMA_DATA_PATH`      | `./docker-volumes/ollama`    | `~/docker/ollama_data`        |
| `OPENWEBUI_DATA_PATH`   | `./docker-volumes/openwebui` | `~/docker/openwebui_data`     |
| `OPENWEBUI_HTTPS_PORT`  | `30443`                      | `30443`                       |
| `OLLAMA_HTTPS_PORT`     | `11444`                      | `11444`                       |
| `OLLAMA_CERT_DIR`       | `./nginx/ssl/cert`           | `/etc/ssl/certs`              |
| `OLLAMA_KEY_DIR`        | `./nginx/ssl/private`        | `/etc/ssl/private`            |
| `OLLAMA_CERT_DOMAIN`    | `localhost`                  | `ram.dfastje.work`            |
| `OLLAMA_CERT_DAYS`      | `365`                        | -                             |

## Deployment Commands

```bash
sudo docker compose down && \
sudo docker compose pull && \
sudo docker compose up -d
```

## Debug Commands

```bash
sudo docker logs -f ollama
```

```bash
sudo docker logs -f ollama-proxy
```

```bash
sudo docker logs -f openwebui
```

## Volume Maintenance

```bash
sudo rm -rf docker-volumes/ollama/*
```

```bash
sudo rm -rf docker-volumes/openwebui/*
```

## Documentation

- [Ollama Docker Image](https://hub.docker.com/r/ollama/ollama)
- [OpenWebUI Documentation](https://docs.openwebui.com/)
