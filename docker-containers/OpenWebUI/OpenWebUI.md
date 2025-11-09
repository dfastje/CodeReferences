# OpenWebUI Notes

Document setup details, environment variables, and operational tips for the standalone OpenWebUI stack.

## Environment Variables

| Variable                          | Dev Value                          | Prod Value                          |
| :-------------------------------- | :--------------------------------- | :---------------------------------- |
| `OPENWEBUI_DATA_PATH`             | `./docker-volumes/openwebui`       | `~/docker/openwebui_data`           |
| `OPENWEBUI_HTTPS_PORT`            | `30443`                            | `30443`                             |
| `OPENWEBUI_CERT_DIR`              | `./nginx/ssl/cert`                 | `/etc/ssl/certs`                    |
| `OPENWEBUI_KEY_DIR`               | `./nginx/ssl/private`              | `/etc/ssl/private`                  |
| `OPENWEBUI_CERT_DOMAIN`           | `openwebui.local`                  | `openwebui.dfastje.work`            |
| `OPENWEBUI_CERT_DAYS`             | `365`                              | -                                   |
| `OPENWEBUI_TZ`                    | `America/New_York`                 | `America/New_York`                  |
| `OPENWEBUI_OLLAMA_BASE_URL`       | `https://ollama.local:11444`       | `https://ollama.dfastje.work`       |
| `OPENWEBUI_MACVLAN_PARENT`        | (run codeblock to know)            | (host dependent)                    |
| `OPENWEBUI_MAC_ADDRESS`           | `26:a0:1e:ed:23:ff`                | `26:a0:1e:ed:24:00`                 |
| `OPENWEBUI_INTERNAL_MAC_ADDRESS`  | `02:42:ac:11:05:02`                | `02:42:ac:11:05:03`                 |

> Migrating data from the legacy combined stack? Set `OPENWEBUI_DATA_PATH` to the previous directory (e.g., `../Ollama/docker-volumes/openwebui`) or move the volume contents before starting this compose file.

## Networking Notes

- `openwebui_macvlan` gives the reverse proxy a DHCP lease on your LAN so the UI has a dedicated IP.
- `openwebui_internal` is the private bridge that keeps the proxy talking to the OpenWebUI container only.

## Identify `driver_opts.parent`

```bash
echo "$(ip route show default | awk 'NR==1 {print $5}')"
```

## Check Container Network Details

```bash
sudo docker inspect -f '{{range $name,$net := .NetworkSettings.Networks}}{{$name}} -> MAC: {{$net.MacAddress}}{{"\n"}}{{end}}' openwebui-proxy
```
```bash
sudo docker inspect -f '{{range $name,$net := .NetworkSettings.Networks}}{{$name}} -> IP: {{$net.IPAddress}}{{"\n"}}{{end}}' openwebui-proxy
```
## Deployment Commands

```bash
sudo docker compose down && \
sudo docker compose pull && \
sudo docker compose up -d
```

## Debug Commands

```bash
sudo docker logs -f openwebui
```

```bash
sudo docker logs -f openwebui-proxy
```

```bash
sudo docker exec -it ollama wget -qO- https://ollama.dfastje.com
```

## Documentation

- [OpenWebUI Documentation](https://docs.openwebui.com/)
- [OpenWebUI Container Image](https://github.com/open-webui/open-webui/pkgs/container/open-webui)
