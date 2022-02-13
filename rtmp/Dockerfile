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

# ffmpeg install
WORKDIR /usr/local/src/
RUN wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz \
      && tar Jxvf ffmpeg-release-amd64-static.tar.xz \
      && cp ffmpeg-*-amd64-static/ffmpeg /usr/bin/

WORKDIR /var/local/www/hls