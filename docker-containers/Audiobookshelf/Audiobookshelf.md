# Audiobookshelf Notes

Document setup details, environment variables, and operational tips here.

## Environment Variables

| Variable                     | Dev Value                     | Prod Value                        |
| :--------------------------- | :---------------------------- |:----------------------------------|
| `AUDIOBOOK_PATH`             | `./docker-volumes/audiobooks` | `~/docker/audiobookshelf_media`   |
| `AUDIOBOOK_CONFIG_PATH`      | `./docker-volumes/config`     | `~/docker/audiobookshelf_config`  |
| `AUDIOBOOK_METADATA_PATH`    | `./docker-volumes/metadata`   | `~/docker/audiobookshelf_metadata`|
| `AUDIOBOOKSHELF_CERT_DIR`    | `./nginx/ssl/cert`            | `/etc/ssl/certs`                  |
| `AUDIOBOOKSHELF_KEY_DIR`     | `./nginx/ssl/private`         | `/etc/ssl/private`                |
| `AUDIOBOOKSHELF_CERT_DOMAIN` | `ram.dfastje.work`            | -                                 |
| `AUDIOBOOKSHELF_CERT_DAYS`   | `365`                         | -                                 |

## Deployment Commands

```bash
sudo docker compose down && \
sudo docker compose pull && \
sudo docker compose up -d
```

## Documentation

- [Audiobookshelf Docker Compose Guide](https://www.audiobookshelf.org/docs/#docker-compose-install)
- [Audiobookshelf Docker Hub Image](https://hub.docker.com/r/advplyr/audiobookshelf)
