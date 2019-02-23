# portainer
read more [here](https://www.portainer.io/), [here](https://www.upnxtblog.com/index.php/2018/01/17/top-6-gui-tools-for-managing-docker-environments/) and [here (ru)](https://habr.com/ru/company/flant/blog/338332/) and of course [here](https://hub.docker.com/r/portainer/portainer)

```bash
mkdir /tmp/portainer-data
docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v /tmp/portainer-data:/data portainer/portainer
```

open http://127.0.0.1:9000/
