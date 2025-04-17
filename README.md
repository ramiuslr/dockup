dockup
---

# Quick start
Get the provided `compose.yaml`.
```bash
docker compose up -d
```

# Dependencies
This program needs [regctl](https://github.com/regclient/regclient.git).
It is shipped with container image by default.

# Configuration
Configuration options are available via environment variables:
- `DOCKUP_INTERVAL`: Time between refreshes (30 min by default)
- `DOCKUP_PORT`: Change default port - Do not set this option when running via Docker (Defaults to 8000)
