FROM ubuntu:focal

RUN apt-get update &&\
    apt-get install -y \
      wget curl git jq zip \
      vim tmux tree pwgen direnv bash-completion \
      stress

### yj
RUN curl -L https://github.com/sclevine/yj/releases/download/$(curl -s https://api.github.com/repos/sclevine/yj/releases/latest | jq -r .tag_name)/yj-linux-amd64 -o /usr/local/bin/yj &&\
    chmod +x /usr/local/bin/yj

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
