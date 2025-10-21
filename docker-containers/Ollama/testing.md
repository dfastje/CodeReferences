# Live GPU Test with OpenWebUI

This single workflow proves the Ollama container can see the GPU and that OpenWebUI drives a GPU-backed inference.

| Step | Action                                                                                                 | Success Criteria |
|------|--------------------------------------------------------------------------------------------------------|------------------|
| 1    | In a terminal, run `sudo docker exec -it ollama watch -n 2 nvidia-smi`                                    | Watch starts streaming GPU metrics; no errors returned. |
| 2    | In another tab, browse to https://localhost:${OLLAMA_HTTPS_PORT:-11444} and sign in to OpenWebUI          | UI loads and lets you select the Ollama provider. |
| 3    | Send the prompt `Write a buildout plan for building an org from scratch under the AWS SRA` from OpenWebUI | Response returns successfully. |
| 4    | Observe the first terminal while the response streams                                                     | `nvidia-smi` output shows the `ollama` process with non-zero GPU utilization and memory usage. |

> Tip: Use `Ctrl+C` to stop `watch` after you confirm the utilization spike. If the GPU metrics stay at zero, ensure the Ollama service was launched with GPU support and review the container logs.
