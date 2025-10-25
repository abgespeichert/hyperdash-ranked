# hyperdash-ranked

For quickstart, eg. when starting the system on a virtual machine
just run this once, and forget. the script will run the steps of
the instructions below automatically.

```bash
chmod +x quickstart.sh
./quickstart.sh
```

Install Hyperdash's redis database, via:

```bash
docker run -d \
  --name hyperdash-redis \
  --restart unless-stopped \
  -p 6379:6379 \
  redis:latest
```

This should be donce once, and then we can just control the container, via:

```bash
docker start hyperdash-redis
docker stop hyperdash-redis
```

After redis is running, we can either start our Flask app, for development.
This will be just done with python, and no gunicorn or docker.

For example:

```bash
source venv/bin/activate
python app.py
```

However, if we want to run it as a production service,
we should use gunicorn with docker, for a safe and stable config.

```bash
docker run -d \
  --name hyperdash-ranked \
  --restart unless-stopped \
  -p 8000:8000 \
  hyperdash-ranked
```

We can easily control this Docker too, with:

```bash
docker stop hyperdash-ranked
docker start hyperdash-ranked
```
