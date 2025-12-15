# Nextcloud Notes

Document setup details, environment variables, and operational tips for the Nextcloud stack.

## Environment Variables

| Variable                         | Dev Value                         | Prod Value                 |
|:---------------------------------|:----------------------------------|:---------------------------|
| `NEXTCLOUD_DATA_PATH`            | `./docker-volumes/nextcloud`      | `~/docker/nextcloud`       |
| `NEXTCLOUD_DB_DATA_PATH`         | `./docker-volumes/db`             | `~/docker/nextcloud_db`    |
| `NEXTCLOUD_REDIS_DATA_PATH`      | `./docker-volumes/redis`          | `~/docker/nextcloud_redis` |
| `NEXTCLOUD_DB_ROOT_PASSWORD`     | `changeme-root`                   | -                          |
| `NEXTCLOUD_DB_NAME`              | `nextcloud`                       | -                          |
| `NEXTCLOUD_DB_USER`              | `nextcloud`                       | -                          |
| `NEXTCLOUD_DB_PASSWORD`          | `changeme`                        | -                          |
| `NEXTCLOUD_ADMIN_USER`           | `admin`                           | -                          |
| `NEXTCLOUD_ADMIN_PASSWORD`       | `changeme`                        | -                          |
| `NEXTCLOUD_TRUSTED_DOMAINS`      | `nextcloud.local localhost`       | `nextcloud.dfastje.work`   |
| `NEXTCLOUD_TRUSTED_PROXIES`      | (optional)                        | (set to proxy/subnet)      |
| `NEXTCLOUD_OVERWRITEPROTOCOL`    | `https`                           | `https`                    |
| `NEXTCLOUD_PHP_MEMORY_LIMIT`     | `512M`                            | (host dependent)           |
| `NEXTCLOUD_PHP_UPLOAD_LIMIT`     | `16G`                             | (host dependent)           |
| `NEXTCLOUD_TZ`                   | `America/New_York`                | `America/New_York`         |
| `NEXTCLOUD_HTTPS_PORT`           | `443`                             | `443`                      |
| `NEXTCLOUD_CERT_DIR`             | `./nginx/ssl/cert`                | `/etc/ssl/certs`           |
| `NEXTCLOUD_KEY_DIR`              | `./nginx/ssl/private`             | `/etc/ssl/private`         |
| `NEXTCLOUD_CERT_DOMAIN`          | `nextcloud.local`                 | `nextcloud.example.com`    |
| `NEXTCLOUD_CERT_DAYS`            | `365`                             | -                          |
| `NEXTCLOUD_MACVLAN_PARENT`       | (run codeblock to know)           | (host dependent)           |
| `NEXTCLOUD_MAC_ADDRESS`          | `26:a0:1e:ed:24:01`               | `26:a0:1e:ed:24:02`        |
| `NEXTCLOUD_INTERNAL_MAC_ADDRESS` | `02:42:ac:11:06:02`               | `02:42:ac:11:06:03`        |

## Networking Notes

- `nextcloud_macvlan` connects only the reverse proxy to the LAN; it holds the static MAC so you can reserve DHCP leases.
- `shared_ai_bridge` (from `docker-containers/SharedAI`) carries east-west traffic between Nextcloud, MariaDB, Redis, and the reverse proxy without exposing services directly.

> Create the SharedAI bridge (see `docker-containers/SharedAI/SharedAI.md`) before deploying Nextcloud so `shared_ai_bridge` already exists.

## Identify `driver_opts.parent`

```bash
echo "$(ip route show default | awk 'NR==1 {print $5}')"
```
## Identify shared_ai_bridge Network Details
```bash
sudo docker network inspect shared_ai_bridge  -f '{{(index .IPAM.Config 0).Subnet}}'
```

## Check Container Network Details
```bash
sudo docker inspect -f '{{range $name,$net := .NetworkSettings.Networks}}{{$name}} -> MAC: {{$net.MacAddress}}{{"\n"}}{{end}}' nextcloud-proxy
```
```bash
sudo docker inspect -f '{{range $name,$net := .NetworkSettings.Networks}}{{$name}} -> IP: {{$net.IPAddress}}{{"\n"}}{{end}}' nextcloud-proxy
```

## Deployment Commands
```bash
sudo docker compose down && \
sudo docker compose pull && \
sudo docker compose up -d
```

## Debug Commands
```bash
sudo docker logs -f nextcloud
```
```bash
sudo docker logs -f nextcloud-db
```
```bash
sudo docker logs -f nextcloud-proxy
```
## Volume Maintenance
```bash
sudo rm -rf docker-volumes/nextcloud/*
```
```bash
sudo rm -rf docker-volumes/db/*
```
## Documentation

https://hub.docker.com/_/nextcloud

https://docs.nextcloud.com/
