# SharedAI Notes

Create and manage the shared Docker bridge network that other AI-focused stacks attach to for cross-project connectivity.

## Network Details

- This project defines a single shared bridge called `shared_ai_bridge`.
- Create it once with `docker network create` (rerun only if you remove the network later).
- The bridge is `attachable`, so `docker run --network shared_ai_bridge …` works outside compose files.

## Create/Refresh the Network

```bash
docker network create \
  --driver bridge \
  --attachable \
  --opt com.docker.network.bridge.name="br-shared-ai" \
  shared_ai_bridge
```

## Verification

```bash
docker network inspect shared_ai_bridge
```
