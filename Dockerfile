# Build stage
FROM node:20-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Runtime stage - serve with nginx
FROM nginx:alpine

COPY --from=builder /app/dist /usr/share/nginx/html/whiteboard-recorder

# Configure nginx for subpath deployment
RUN echo 'server { \
    listen 80; \
    location /whiteboard-recorder { \
        alias /usr/share/nginx/html/whiteboard-recorder; \
        try_files $uri $uri/ /whiteboard-recorder/index.html; \
    } \
}' > /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
