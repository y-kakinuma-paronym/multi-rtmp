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