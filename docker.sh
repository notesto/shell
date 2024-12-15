apk update && apk add docker
rc-update add docker default
service docker start

echo "docker 安装完毕"

curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

echo "docker-compose 安装完毕"

docker -v
docker-compose -v
