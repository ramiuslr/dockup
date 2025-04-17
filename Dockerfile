# Init image
FROM python:3
WORKDIR /app

# Install requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN wget -O /usr/bin/regctl https://github.com/regclient/regclient/releases/latest/download/regctl-linux-amd64
RUN chmod 755 /usr/bin/regctl

# Import app
COPY dockup .
RUN chmod +x dockup

# Run it
EXPOSE 8000
CMD ["./dockup"]

