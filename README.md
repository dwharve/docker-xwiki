# docker-xwiki

XWiki Dockerfile for automated build

## Run with persistant data
```bash
docker run --name xwiki -d -p 8080:8080 -v /opt/xwiki:/usr/local/xwiki/data dwharve/xwiki
```
