
```bash
docker run -d --rm --name app -p 80:80 -v `pwd`/dist:/usr/share/nginx/html:ro \
          --health-cmd="wget -q --spider http://127.0.0.1:80/ || exit 1" \
          --health-start-period=1s \
          --health-interval=1s \
          --health-retries=33 \
          --health-timeout=1s \
           nginx:1.17.6-alpine
```
