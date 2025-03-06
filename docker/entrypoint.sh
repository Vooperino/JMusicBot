#!/bin/sh

WORKDIR=/opt/jmusicbot

cd ${WORKDIR}

if [ ! -d "$WORKDIR/data" ]; then
    echo "[PRE EXECUTE] Misconfigured docker volume. Please mount a volume to /app/data"
    exit 1
fi

if [ ! -f "$WORKDIR/data/config.txt" ]; then
    cp /clean/config.txt $WORKDIR/data/config.txt
fi

if [ -f "$WORKDIR/data/serversettings.json" ]; then
    cp "$WORKDIR/data/serversettings.json" "$WORKDIR/serversettings.json"
fi

cp $WORKDIR/data/config.txt $WORKDIR/config.txt

FREETYPE_PROPERTIES="truetype:interpreter-version=35"
echo "Starting Supervisor..."
exec supervisord -c ${WORKDIR}/supervisord.conf
