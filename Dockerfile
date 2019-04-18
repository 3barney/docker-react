# 1st is the builder phase, build and install deps
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# 2nd phase copy from builder phase (/app/builder) to nginx
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html