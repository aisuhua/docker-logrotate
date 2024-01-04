FROM alpine:3.12

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN set -x \
  && apk add --no-cache logrotate tini tzdata moreutils \
  && rm /etc/logrotate.conf && rm -r /etc/logrotate.d \
  && mv /etc/periodic/daily/logrotate /etc/.logrotate.cronjob

COPY entrypoint.sh /entrypoint.sh

VOLUME ["/logs"]

ENTRYPOINT ["tini", "-g", "--"]
CMD ["/entrypoint.sh"]
