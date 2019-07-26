docker rm -f hello-world1 hello-world2

docker run -d --rm --name hello-world1 -p 8080:8080     \
    --log-driver=fluentd     \
    --log-opt fluentd-address=localhost:24224     \
    --log-opt tag="app.hello.{{.Name}}"     \
    --label production=dev \
    voyagerwoo/hello-world:v1

docker run -d --rm --name hello-world2 -p 8081:8080     \
    --log-driver=fluentd     \
    --log-opt fluentd-address=localhost:24224     \
    --log-opt tag="app.hello.{{.Name}}" \
    --label production=prod \
    voyagerwoo/hello-world:v1
    
    