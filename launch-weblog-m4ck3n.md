```
NAME=weblog-m4ck3n
HOST=m4ck3ngm.com
IMAGE="m4ck3ngm/weblog-m4ck3n"
docker container run -d --name ${NAME} \
    --label traefik.backend=${NAME} \
    --label traefik.docker.network=opt_webgateway \
    --label traefik.frontend.rule=Host:blog.${HOST} \
    --label traefik.port=80 \
    --label com.centurylinklabs.watchtower.enable=true \
    --network opt_webgateway \
    --restart always \
    ${IMAGE}
```
