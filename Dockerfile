# build project
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# copy the result in a nginx server image
FROM nginx
COPY --from=builder /app/build usr/share/nginx/html