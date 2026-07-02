# Deployment Guide

## Server Deployment (aia.bj.cn)

This project is deployed to `https://aia.bj.cn/whiteboard-recorder/` using Docker and Caddy reverse proxy.

### Architecture

- **Build**: Multi-stage Docker build (Node.js 20 + nginx)
- **Port**: 18001 (internal)
- **Public URL**: https://aia.bj.cn/whiteboard-recorder/
- **Reverse Proxy**: Caddy

### Deployment Flow

1. Push to deploy remote triggers post-receive hook
2. Hook checks out code to `/opt/apps/whiteboard-recorder`
3. Docker builds image with `npm install` + `npm run build`
4. Container restarts on port 18001
5. Caddy proxies `https://aia.bj.cn/whiteboard-recorder/` → `172.17.0.1:18001`

### Manual Deploy

```bash
# Add deploy remote (one-time setup)
git remote add deploy ssh://root@106.55.60.190:61922/opt/repos/whiteboard-recorder.git

# Deploy
git push deploy main
```

### Server Commands

```bash
# SSH into server
ssh -p 61922 root@106.55.60.190

# Check container status
docker ps | grep whiteboard

# View logs
docker logs whiteboard-recorder

# Restart container
cd /opt/apps/whiteboard-recorder && docker compose restart

# Rebuild
cd /opt/apps/whiteboard-recorder && docker compose up -d --build
```

### Caddy Configuration

Located at `/opt/apps/caddy/Caddyfile`:

```caddyfile
# 白板录制工具（不移除路径前缀）
redir /whiteboard-recorder /whiteboard-recorder/
handle /whiteboard-recorder/* {
    reverse_proxy 172.17.0.1:18001
}
```

Reload Caddy after config changes:

```bash
docker exec caddy caddy reload --config /etc/caddy/Caddyfile
```

## Local Development

```bash
npm install
npm run dev
```

Open http://localhost:5173/whiteboard-recorder/ (note the base path).

## Build Locally

```bash
npm run build
npm run preview
```

The preview server will serve at the configured base path.
