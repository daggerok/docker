# rancher
ignore this playground....
<!--
run some container

```bash
brew cask install virtualbox-beta
docker-machine create machine --driver virtualbox \
                              --virtualbox-cpu-count "-1" \
                              --virtualbox-disk-size "8000" \
                              --virtualbox-memory "512" \
                              --virtualbox-boot2docker-url="https://github.com/boot2docker/boot2docker/releases/download/v1.10.3/boot2docker.iso"
docker-machine ssh machine
sudo /etc/init.d/docker start --overwrite

docker run --name redis -d -p 6379:6379 redis
docker exec -it redis redis-cli ping
exit
docker-machine rm -f machine
```
-->
run rancher


```bash
docker run -it --rm -p 8080:8080 rancher/server
```

links:

- [Running Docker and Rancher Locally on Dev Machines - May 2016 Online Meetup](https://www.youtube.com/watch?v=sS3gO5h88M4)
- [used boot2docker v.1.10.3](https://github.com/boot2docker/boot2docker/releases/tag/v1.10.3)
- [instasll runcher](https://rancher.com/docs/rancher/v1.6/en/installing-rancher/installing-server/)
