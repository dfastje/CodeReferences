# Dev Environment Cleanup

Use these commands to reset the local Docker development environment when you
need a clean slate.

## Remove All Containers

```bash
sudo docker rm -f $(sudo docker ps -aq)
```

## Remove Unused Volumes

```bash
sudo docker volume prune -f
sudo docker volume rm $(sudo docker volume ls -q)
```

## (Optional) Additional Pruning

```bash
sudo docker container prune
```

```bash
sudo docker network prune
```
