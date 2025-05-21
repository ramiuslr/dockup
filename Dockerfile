# Init image
FROM python:slim
WORKDIR /app

# Install requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN python - <<EOF
from urllib.request import urlopen;
from pathlib import Path;
Path("/usr/bin/regctl").write_bytes(urlopen("https://github.com/regclient/regclient/releases/latest/download/regctl-linux-amd64").read())
EOF

RUN chmod 755 /usr/bin/regctl

# Import app
COPY dockup .
RUN chmod +x dockup

# Run it
EXPOSE 8000
CMD ["./dockup"]

