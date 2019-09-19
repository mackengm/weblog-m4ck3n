```
NAME=weblog-m4ck3n
HOST=summittdweller.com
IMAGE="summittdweller/weblog-m4ck3n"
docker container run -d --name ${NAME} \
    --label traefik.backend=${NAME} \
    --label traefik.docker.network=opt_webgateway \
    --label "traefik.frontend.rule=Host:${HOST};PathPrefixStrip:/blogs/m4ck3n" \
    --label traefik.port=80 \
    --label com.centurylinklabs.watchtower.enable=true \
    --network opt_webgateway \
    --restart always \
    ${IMAGE}
```
