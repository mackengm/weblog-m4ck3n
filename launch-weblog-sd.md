```
NAME=weblog-sd
HOST=summittdweller.com
IMAGE="summittdweller/weblog-sd"
docker container run -d --name ${NAME} \
    --label traefik.backend=${NAME} \
    --label traefik.docker.network=traefik_webgateway \
    --label "traefik.frontend.rule=Host:${HOST};PathPrefixStrip:/blogs/mark" \
    --label traefik.port=80 \
    --label com.centurylinklabs.watchtower.enable=true \
    --network traefik_webgateway \
    --restart always \
    ${IMAGE}
```
