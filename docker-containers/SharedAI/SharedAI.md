# SharedAI Notes

Create and manage the shared Docker bridge network that other AI-focused stacks attach to for cross-project connectivity.

## Network Details

- This compose file only declares the shared bridge; no containers run as part of this stack.
- Docker automatically chooses the subnet for the bridge unless you create it ahead of time with `docker network create`.
- The bridge is marked `attachable`, enabling `docker run --network shared_ai_bridge …` without compose.

## Deployment Commands

Bring the stack up once to materialize the bridge (rerun only if you removed the network):

```bash
docker compose up --detach
```

## Verification

```bash
sudo docker network inspect shared_ai_bridge
```
