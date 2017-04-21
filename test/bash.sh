# ubuntu
docker rmi -f test/spark:1.8
docker build -t test/spark:1.8 .
docker run -it --rm test/spark:1.8 bash

# alpine
apk search pdsh
apk add openssh
