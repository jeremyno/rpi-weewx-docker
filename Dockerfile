FROM resin/rpi-raspbian:jessie

RUN curl http://weewx.com/keys.html | sudo apt-key add - \
    && curl http://weewx.com/apt/weewx.list | sudo tee /etc/apt/sources.list.d/weewx.list \
    && apt-get update \
    && apt-get install weewx

VOLUME ["/var/lib/weewx/"]

CMD ["/usr/bin/weewxd","/etc/weewx/weewx.conf"]