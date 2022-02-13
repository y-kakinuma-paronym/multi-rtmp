FROM ubuntu:20.04

RUN apt update
RUN apt upgrade -y
RUN apt auto-remove -y

RUN apt install -y language-pack-ja
RUN update-locale LANG=ja_JP.UTF8

RUN apt install -y build-essential libpcre3 libpcre3-dev libssl-dev libz-dev zlib1g-dev unzip git curl wget vim
WORKDIR /usr/local/src/
RUN curl -LO http://nginx.org/download/nginx-1.20.0.tar.gz
RUN curl -LO https://github.com/arut/nginx-rtmp-module/archive/afd350e0d8b7820d7d2cfc3fa748217153265ce6.tar.gz
RUN tar xvzf nginx-1.20.0.tar.gz
RUN tar xvzf afd350e0d8b7820d7d2cfc3fa748217153265ce6.tar.gz
WORKDIR /usr/local/src/nginx-1.20.0
RUN ./configure --with-http_ssl_module --add-module=../nginx-rtmp-module-afd350e0d8b7820d7d2cfc3fa748217153265ce6 --with-debug
RUN make
RUN make install
COPY conf/nginx.conf /usr/local/nginx/conf/nginx.conf
WORKDIR /var/local/www/hls
RUN chmod 777 /var/local/www/hls

# nginx実行
# Dockerfileから実行するとコンテナが実行できないためとりあえず手動で実行する
# CMD /usr/local/nginx/sbin/nginx
