# Ollama Notes

Document setup details, environment variables, and operational tips here.

## Environment Variables

| Variable                       | Dev Value                 | Prod Value                 |
| :----------------------------- |:--------------------------|:---------------------------|
| `OLLAMA_DATA_PATH`             | `./docker-volumes/ollama` | `~/docker/ollama_data`     |
| `OLLAMA_HTTPS_PORT`            | `443`                     | `443`                      |
| `OLLAMA_CERT_DIR`              | `./nginx/ssl/cert`        | `/etc/ssl/certs`           |
| `OLLAMA_KEY_DIR`               | `./nginx/ssl/private`     | `/etc/ssl/private`         |
| `OLLAMA_CERT_DOMAIN`           | `ollama.local`            | `ollama.dfastje.work`      |
| `OLLAMA_CERT_DAYS`             | `365`                     | -                          |
| `OLLAMA_MACVLAN_PARENT`        | (run codeblock to know)   | (host dependent)           |
| `OLLAMA_MAC_ADDRESS`           | `26:a0:1e:ed:23:fd`       | `26:a0:1e:ed:23:fe`        |
| `OLLAMA_INTERNAL_MAC_ADDRESS`  | `02:42:ac:11:04:02`       | `02:42:ac:11:04:03`        |

> Looking for OpenWebUI? It now lives in `docker-containers/OpenWebUI` with its own compose stack and documentation.
> `OLLAMA_HTTPS_PORT` controls both the host-facing TLS port and the daemon's internal `OLLAMA_HOST` binding.

## Networking Notes

- `ollama_macvlan` connects only the reverse proxy to the LAN; it holds the static MAC so you can reserve DHCP leases.
- `shared_ai_bridge` (created via [`docker-containers/SharedAI`](../SharedAI/SharedAI.md)) is the shared internal bridge the stack uses for east-west traffic; the proxy keeps a static MAC there as well.

> Create the SharedAI bridge (see [`docker-containers/SharedAI`](../SharedAI/SharedAI.md)) before deploying Ollama so `shared_ai_bridge` already exists.

## Identify `driver_opts.parent`

```bash
echo "$(ip route show default | awk 'NR==1 {print $5}')"
```

## Check Container Network Details

```bash
sudo docker inspect -f '{{range $name,$net := .NetworkSettings.Networks}}{{$name}} -> MAC: {{$net.MacAddress}}{{"\n"}}{{end}}' ollama-proxy
```
```bash
sudo docker inspect -f '{{range $name,$net := .NetworkSettings.Networks}}{{$name}} -> IP: {{$net.IPAddress}}{{"\n"}}{{end}}' ollama-proxy
```

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

## Volume Maintenance

```bash
sudo rm -rf docker-volumes/ollama/*
```

## Documentation

- [Ollama Docker Image](https://hub.docker.com/r/ollama/ollama)
- [Local OpenWebUI Stack](../OpenWebUI/OpenWebUI.md)
- [OpenWebUI Documentation](https://docs.openwebui.com/)
