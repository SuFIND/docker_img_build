FROM ubuntu:bionic

# set timezone
ENV TZ=Asia/Shanghai

RUN echo "Asia/Shanghai" > /etc/timezone

WORKDIR /tmp
COPY ./build.sh ./
RUN ./build.sh