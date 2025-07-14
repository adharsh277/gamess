# Dockerfile
FROM node:18-alpine as build

WORKDIR /app
COPY . .
RUN npm install
RUN npm run build:demo      # ✅ Fixed this line

FROM nginx:alpine
COPY --from=build /app/demo/public /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
