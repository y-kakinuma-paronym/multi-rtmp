# Docker RTMPサーバ


![マルチ配信](https://user-images.githubusercontent.com/70195754/153760143-4a0d3230-dda1-444f-9eae-9d94bd1ef7f5.png)

## 内容物

- `player1.html` & `player2.html`
  - RTMPで配信しているビデオのストリームのHLSで視聴するためのHTMLファイル(動作確認用)
  - `player1.html` と `player2.html` は別々のビデオソースを参照している
- `rtmp/Dockerfile`
  - RTMPサーバのDockerfile
- `rtmp/conf/nginx.conf`
  - Nginxの設定ファイル
- `docker-compose.yml`
  - 説明省略
- `Makefile`
  - よく使うdocker系のコマンドをまとめている

## RTMP中継のffmpegコマンド

docker内で実行

```
ffmpeg -re -i rtmp://localhost/live/hoge -codec:v libx264 -g 3 -f flv rtmp://localhost/stream1/hoge
```
