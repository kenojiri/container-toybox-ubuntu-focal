FROM ubuntu:focal

RUN apt-get update &&\
    apt-get install -y \
      wget curl git jq zip \
      vim tmux tree pwgen direnv bash-completion \
      stress

### Minio CLI ###
RUN curl -vL https://dl.minio.io/client/mc/release/linux-amd64/mc -o /usr/local/bin/mc &&\
    chmod +x /usr/local/bin/mc

### create workspace directory ###
RUN mkdir /work
WORKDIR /work

### create user/group ###
RUN useradd -u 1000 -U -m user && usermod -a -G sudo user
USER 1000:1000
COPY _bash_profile /home/user/.bash_profile

CMD ["/bin/bash", "--login"]
