mkdir -p log
sudo chmod 777 -R log

docker rm -f fluentd-prac

docker run -d --name fluentd-prac \
    -p 24224:24224 -p 24224:24224/udp \
    -v `pwd`/log:/log \
    fluentd-prac:v1.6-1