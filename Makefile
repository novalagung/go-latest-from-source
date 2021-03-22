alpine:
    docker build -f ./dockerfiles/alpine.Dockerfile . -t novalagung/go-latest-from-source:alpine
centos:
    docker build -f ./dockerfiles/centos.Dockerfile . -t novalagung/go-latest-from-source:centos
ubuntu:
    docker build -f ./dockerfiles/ubuntu.Dockerfile . -t novalagung/go-latest-from-source:ubuntu
