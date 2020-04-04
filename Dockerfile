FROM node:alpine as builder
WORKDIR /app
RUN npm install -g @angular/cli
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/dist /usr/share/nginx/html