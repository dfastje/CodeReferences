# Nextcloud Notes

Document setup details, environment variables, and operational tips here.

## Environment Variables

| Variable                         | Dev Value                             | Prod Value                     |
|:---------------------------------|:--------------------------------------|:-------------------------------|
| `NEXTCLOUD_DATADIR`              | `./docker-volumes/nextcloud-data`     | `/mnt/media/nextcloud`         |
| `NEXTCLOUD_AIO_CONFIG_PATH`      | `./docker-volumes/nextcloud-config`   | `~/docker/nextcloud_aio_config`|
| `AIO_DISABLE_SSL`                | `true`                                | `true`                         |
| `NEXTCLOUD_CERT_DOMAIN`          | `nextcloud.local`                     | `cloud.example.com` (set yours)|
| `NEXTCLOUD_CERT_DAYS`            | `365`                                 | `365` (set per policy)         |
| `NEXTCLOUD_CERT_DIR`             | `./nginx/ssl/cert`                    | `/etc/ssl/certs`               |
| `NEXTCLOUD_KEY_DIR`              | `./nginx/ssl/private`                 | `/etc/ssl/private`             |
| `NEXTCLOUD_MACVLAN_PARENT`       | `enp4s0` (check yours)                | (host dependent)               |
| `NEXTCLOUD_MAC_ADDRESS`          | `26:a0:1e:ed:24:01`                   | `26:a0:1e:ed:24:02`            |
| `NEXTCLOUD_INTERNAL_MAC_ADDRESS` | `02:42:ac:11:06:02`                   | `02:42:ac:11:06:03`            |

## Usage Notes

- Nginx terminates TLS; Nextcloud AIO SSL is disabled (`AIO_DISABLE_SSL=true`).
- External port: HTTPS `8443` on the proxy (HTTP is not published; internal only for redirect).
- The master container launches the full stack; keep `/var/run/docker.sock` mounted read-only.
- Ensure the data directory path exists on the host before first run (especially `/mnt/media/nextcloud` in prod).
- Cert filenames are fixed to `dfastjework.crt`/`dfastjework.key` to reuse the same cert as Audiobookshelf; mount the same cert directory when sharing.
- Proxy uses a macvlan (`nextcloud_macvlan`) for LAN reachability and an internal bridge (`nextcloud_internal`) to reach the AIO master with deterministic MACs.

## View Logs

```bash
sudo docker logs -f nextcloud-aio-mastercontainer
```

## Deployment Commands

```bash
sudo docker compose down && \
sudo docker compose pull && \
sudo docker compose up -d
```

## Documentation

- [Nextcloud All-in-One](https://github.com/nextcloud/all-in-one)
- [Nextcloud AIO FAQ](https://github.com/nextcloud/all-in-one/blob/main/FAQ.md)
