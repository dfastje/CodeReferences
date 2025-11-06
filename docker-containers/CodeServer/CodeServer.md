# Code Server Notes

Document setup details, environment variables, and operational tips here.

## Environment Variables

| Variable                          | Dev Value                     | Prod Value                   |
| :-------------------------------- | :---------------------------- |:-----------------------------|
| `CODE_SERVER_CONFIG_PATH`         | `./docker-volumes/config`     | `~/docker/codeserver_config` |
| `CODE_SERVER_PASSWORD`            | `changeme`                    | -                            |
| `CODE_SERVER_SUDO_PASSWORD`       | `changeme`                    | -                            |
| `CODE_SERVER_CERT_DIR`            | `./nginx/ssl/cert`            | `/etc/ssl/certs`             |
| `CODE_SERVER_KEY_DIR`             | `./nginx/ssl/private`         | `/etc/ssl/private`           |
| `CODE_SERVER_CERT_DOMAIN`         | `code-server.local`           | -                            |
| `CODE_SERVER_CERT_DAYS`           | `365`                         | -                            |
| `CODE_SERVER_MACVLAN_PARENT`      | (run codeblock to know)       | (host dependent)             |
| `CODE_SERVER_MAC_ADDRESS`         | `26:a0:1e:ed:23:f9`           | `26:a0:1e:ed:23:fa`          |
| `CODE_SERVER_INTERNAL_MAC_ADDRESS`| `02:42:ac:11:02:02`           | `02:42:ac:11:02:03`          |

## Networking Notes

- `codeserver_macvlan` provides a LAN IP/MAC to the proxy so it can be reached directly from the network.
- `codeserver_internal` is a private bridge network for proxy-to-app traffic, keeping the macvlan interface dedicated to LAN access.

## Identify `driver_opts.parent`

```bash
echo "$(ip route show default | awk 'NR==1 {print $5}')"
```

## Check Container Network Details

```bash
sudo docker inspect -f '{{range $name,$net := .NetworkSettings.Networks}}{{$name}} -> MAC: {{$net.MacAddress}}{{"\n"}}{{end}}' code-server-proxy
```
```bash
sudo docker inspect -f '{{range $name,$net := .NetworkSettings.Networks}}{{$name}} -> IP: {{$net.IPAddress}}{{"\n"}}{{end}}' code-server-proxy
```

## View Logs

```bash
sudo docker logs -f code-server
```
```bash
sudo docker logs -f code-server-proxy
```

## Deployment Commands

```bash
sudo docker compose down && \
sudo docker compose pull && \
sudo docker compose up -d
```

## Documentation

- [LinuxServer.io Code Server Docs](https://docs.linuxserver.io/images/docker-code-server)
- [Code Server Docker Hub Image](https://hub.docker.com/r/linuxserver/code-server)
