Fork from https://github.com/linkyard/docker-logrotate

Usages

```sh
docker build -t aisuhua/logrotate:latest .
sudo chown root:root logrotate.conf
sudo chmod 644 logrotate.conf
docker run --rm --name logrotate -e LOGROTATE_CRON=hourly -v "./logrotate.conf":/etc/logrotate.conf aisuhua/logrotate:latest
```
