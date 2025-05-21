dockup
---

# Presentation
Monitoring docker container updates is not that simple. This project's purpose is to expose JSON metrics, comparing local and remote tags, featuring semver checks and suffix preservation.

# Quick start
Get the provided `compose.yaml`.
```bash
docker compose up -d
```

All images are exposed to `http://0.0.0.0:8000/all` in JSON format.

If you want to get only images needing update, look at `http://0.0.0.0:8000/updates`.

Here is a quick example of what you get on the `/all` endpoint (dockup don't have local tag because it is a locally built image):
```json
[
  {
    "name": "dockup",
    "repo": "dockup-dockup",
    "local_tag": "latest",
    "remote_tag": null
  },
  {
    "name": "wikijs-wiki-1",
    "repo": "ghcr.io/requarks/wiki",
    "local_tag": "2.5.307",
    "remote_tag": "2.5.307"
  },
  {
    "name": "wikijs-db-1",
    "repo": "postgres",
    "local_tag": "17.4-alpine",
    "remote_tag": "17.5-alpine"
  }
]
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
