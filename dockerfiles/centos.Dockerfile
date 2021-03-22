# set base image for build
FROM centos:8 AS build

# install dependencies
RUN yum install -y curl git

# install go toolchain
WORKDIR /home 
ENV GOROOT_BOOTSTRAP=/usr/local/go1.4
RUN curl -O https://storage.googleapis.com/golang/go1.4.3.linux-amd64.tar.gz
RUN tar -zxf go1.4.3.linux-amd64.tar.gz && mv go ${GOROOT_BOOTSTRAP}

# obtain go source code
WORKDIR /usr/local
RUN git clone --progress --verbose --depth 1 https://go.googlesource.com/go
WORKDIR /usr/local/go/src
RUN bash ./all.bash

# set base image for implementation
FROM centos:8 AS implementation

# copy binary
COPY --from=build /usr/local/go /usr/local/go
ENV GOROOT=/usr/local/go
ENV PATH=${GOROOT}/bin:${PATH}

# test binary
RUN go version
