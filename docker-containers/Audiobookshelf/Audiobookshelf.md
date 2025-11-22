# Audiobookshelf Notes

Document setup details, environment variables, and operational tips here.

## Environment Variables

| Variable                             | Dev Value                     | Prod Value                         |
|:-------------------------------------|:------------------------------|:-----------------------------------|
| `AUDIOBOOK_PATH`                     | `./docker-volumes/audiobooks` | `/mnt/media/audiobooks`            |
| `AUDIOBOOK_CONFIG_PATH`              | `./docker-volumes/config`     | `~/docker/audiobookshelf_config`   |
| `AUDIOBOOK_METADATA_PATH`            | `./docker-volumes/metadata`   | `~/docker/audiobookshelf_metadata` |
| `AUDIOBOOKSHELF_CERT_DIR`            | `./nginx/ssl/cert`            | `/etc/ssl/certs`                   |
| `AUDIOBOOKSHELF_KEY_DIR`             | `./nginx/ssl/private`         | `/etc/ssl/private`                 |
| `AUDIOBOOKSHELF_CERT_DOMAIN`         | `audiobookshelf.local`        | audiobookshelf.dfastje.work        |
| `AUDIOBOOKSHELF_CERT_DAYS`           | `365`                         | -                                  |
| `AUDIOBOOKSHELF_MACVLAN_PARENT`      | (run codeblock to know)       | (host dependent)                   |
| `AUDIOBOOKSHELF_MAC_ADDRESS`         | `26:a0:1e:ed:23:f8`           | `26:a0:1e:ed:23:f7`                |
| `AUDIOBOOKSHELF_INTERNAL_MAC_ADDRESS`| `02:42:ac:11:01:02`           | `02:42:ac:11:01:03`                |

## Networking Notes

- `audiobookshelf_macvlan` gives the reverse proxy a LAN address and fixed MAC for DHCP/static mapping.
- `audiobookshelf_internal` is the private bridge network the proxy uses to reach the app container with its own deterministic MAC.

## Identify `driver_opts.parent`

```bash
echo "$(ip route show default | awk 'NR==1 {print $5}')"
```

## Check Container Network Details

```bash
sudo docker inspect -f '{{range $name,$net := .NetworkSettings.Networks}}{{$name}} -> MAC: {{$net.MacAddress}}{{"\n"}}{{end}}' audiobookshelf-proxy
```
```bash
sudo docker inspect -f '{{range $name,$net := .NetworkSettings.Networks}}{{$name}} -> IP: {{$net.IPAddress}}{{"\n"}}{{end}}' audiobookshelf-proxy
```

## View Logs

```bash
sudo docker logs -f audiobookshelf
```
```bash
sudo docker logs -f audiobookshelf-proxy
```

## Deployment Commands

```bash
sudo docker compose down && \
sudo docker compose pull && \
sudo docker compose up -d
```

## Documentation

- [Audiobookshelf Docker Compose Guide](https://www.audiobookshelf.org/docs/#docker-compose-install)
- [Audiobookshelf Docker Hub Image](https://hub.docker.com/r/advplyr/audiobookshelf)
