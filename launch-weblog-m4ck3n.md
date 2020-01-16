```
NAME=weblog-m4ck3n
HOST=m4ck3ngm.com
IMAGE="m4ck3ngm/weblog-m4ck3n"
docker container run -d --name ${NAME} \
    --label traefik.backend=${NAME} \
    --label traefik.docker.network=web \
    --label traefik.frontend.rule=Host:blog.${HOST} \
    --label traefik.port=80 \
    --label com.centurylinklabs.watchtower.enable=true \
    --network web \
    --restart always \
    ${IMAGE}
```
