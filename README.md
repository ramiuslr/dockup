dockup
---

# Quick start
Get the provided `compose.yaml`.
```bash
docker compose up -d
```

# Requirements
This program needs [regctl](https://github.com/regclient/regclient.git).
It is shipped with container image by default, however you'll need to install it by yourself if running script directly.

Install required *Python* libraries if running directly from script:
```bash
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

For local development, add linting tools:
```bash
pip install isort black flake8 pylint
```

This program also needs read access to `/var/run/docker.sock`.

# Configuration
Configuration options are available via environment variables:
- `DOCKUP_INTERVAL`: Time between refreshes (30 min by default)
- `DOCKUP_PORT`: Change default port - Do not set this option when running via Docker (Defaults to 8000)
