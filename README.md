# Docker RTMPサーバ

## 内容物

- `index.html`
  - RTMPで配信しているビデオのストリームのHLSで視聴するためのHTMLファイル
  - video.jsのsourceを都度都度変更する必要あり
- `rtmp/Dockerfile`
  - RTMPサーバのDockerfile
- `rtmp/conf/nginx.conf`
  - Nginxの設定ファイル

## コンテナ実行

```
 docker run -ti -d -p 1935:1935 -p 8080:8080 --name "{コンテナ名}" {イメージ名}
```

## コンテナ実行後に行うこと

- ffmpegインストール
  - `apt install ffmpeg`
- nginx実行
  - `/usr/local/nginx/sbin/nginx`

## RTMP中継のffmpegコマンド

```
ffmpeg -re -i rtmp://localhost/live/stream1 -codec:v libx264 -g 3 -f flv rtmp://localhost/live2/stream1
```