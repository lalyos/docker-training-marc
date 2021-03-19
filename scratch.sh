startdb() {
  declare vol=${1:? rquired}

  #-v $PWD/test:/docker-entrypoint-initdb.d  \
  docker rm -f mydb

  docker run -d \
  -v $PWD/test:/docker-entrypoint-initdb.d \
  -v $vol:/var/lib/mysql \
  --name mydb \
  -e MYSQL_ALLOW_EMPTY_PASSWORD=true \
    mysql

}

list() {
docker exec -it mydb mysql -u root mysql -e "select * from person"
}

docker run -d -P \
  -e TITLE=weekend \
  -e COLOR=orange \
  -e DBHOST=172.17.0.2 \
  --name frontend  \
  lunch:v5