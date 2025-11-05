# FreshRSS Notes

Document setup details, environment variables, and operational tips here.

## Environment Variables

| Variable                        | Dev Value                 | Prod Value                 |
|:--------------------------------|:--------------------------|:---------------------------|
| `FRESHRSS_CONFIG_PATH`          | `./docker-volumes/config` | `~/docker/freshrss_config` |
| `FRESHRSS_CERT_DIR`             | `./nginx/ssl/cert`        | `/etc/ssl/certs`           |
| `FRESHRSS_KEY_DIR`              | `./nginx/ssl/private`     | `/etc/ssl/private`         |
| `FRESHRSS_CERT_DOMAIN`          | `freshrss.local`          | -                          |
| `FRESHRSS_CERT_DAYS`            | `365`                     | -                          |
| `FRESHRSS_MACVLAN_PARENT`       | (run codeblock to know)   | (host dependent)           |
| `FRESHRSS_MAC_ADDRESS`          | `26:a0:1e:ed:23:f6`       | `26:a0:1e:ed:23:f5`        |
| `FRESHRSS_INTERNAL_MAC_ADDRESS` | `02:42:ac:11:00:02`       | -                          |

## Networking Notes

- `freshrss_macvlan` provides the LAN-facing address for the reverse proxy and receives the configured MAC.
- `freshrss_internal` is a private bridge network used for proxy-to-app traffic. A dedicated `FRESHRSS_INTERNAL_MAC_ADDRESS` keeps the proxy deterministic there as well.

## Identify `driver_opts.parent`

Use this snippet to print the interface that should populate `driver_opts.parent`:

```bash
echo "$(ip route show default | awk 'NR==1 {print $5}')"
```

## Check Container Network Details

```bash
sudo docker inspect -f '{{range $name,$net := .NetworkSettings.Networks}}{{$name}} -> MAC: {{$net.MacAddress}}{{"\n"}}{{end}}' freshrss-proxy
```
```bash
sudo docker inspect -f '{{range $name,$net := .NetworkSettings.Networks}}{{$name}} -> IP: {{$net.IPAddress}}{{"\n"}}{{end}}' freshrss-proxy
```

## View Logs

```bash
sudo docker logs -f freshrss
```
```bash
sudo docker logs -f freshrss-proxy
```

## Deployment Commands

```bash
sudo docker compose down && \
sudo docker compose pull && \
sudo docker compose up -d
```

## Documentation

- [LinuxServer.io FreshRSS Docs](https://docs.linuxserver.io/images/docker-freshrss)
- [FreshRSS Docker Hub Image](https://hub.docker.com/r/linuxserver/freshrss)
