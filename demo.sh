docker rm -f hello-world1 hello-world2 hello-world3 hello-world4

docker run -d --rm --name hello-world1 -p 8080:8080     \
    --log-driver=fluentd     \
    --log-opt fluentd-async-connect=true \
    --log-opt fluentd-address=localhost:24224     \
    --log-opt tag="app.hello.{{.Name}}"     \
    --label production=dev \
    voyagerwoo/hello-world:v1

docker run -d --rm --name hello-world2 -p 8081:8080     \
    --log-driver=fluentd     \
    --log-opt fluentd-async-connect=true \
    --log-opt fluentd-address=localhost:24224     \
    --log-opt tag="app.hello.{{.Name}}" \
    --label production=prod \
    voyagerwoo/hello-world:v1


docker run -d --rm --name hello-world3 -p 8082:8080     \
    --log-driver=fluentd     \
    --log-opt fluentd-async-connect=true \
    --log-opt fluentd-address=localhost:24224     \
    --log-opt tag="app.demo.{{.Name}}" \
    --label production=prod \
    voyagerwoo/hello-world:v1
    
docker run -d --rm --name hello-world4 -p 8083:8080 \
    --log-driver=fluentd \
    --log-opt fluentd-async-connect=true \
    --log-opt fluentd-address=localhost:24222 \
    --log-opt tag="app.demo.{{.Name}}" \
    --label production=prod \
    voyagerwoo/hello-world:v1
    