#　JMusicBot JP Docker container configuration file
#  Maintained by CyberRex (CyberRex0)
#  Edited by kichirouhoshino for JMusicBot-JPtoEN
#  Updated by Voop (VoopLV)

FROM alpine:latest

RUN mkdir -p /opt/jmusicbot

RUN mkdir /clean

WORKDIR /opt/jmusicbot

RUN apk update && apk add --no-cache bash openjdk21 supervisor fontconfig ttf-dejavu python3 && rm -rf /var/cache/apk/*

RUN mkdir /clean

COPY docker/config_template.txtt /clean/config.txt

COPY target/*-All.jar /opt/jmusicbot/app.jar+

COPY docker/entrypoint.sh /entrypoint.sh

COPY docker/supervisord.conf /opt/jmusicbot/supervisord.conf

RUN chmod -R 755 /entrypoint.sh

RUN chmod -R 755 /opt/jmusicbot/app.jar

ENTRYPOINT ["/entrypoint.sh"]