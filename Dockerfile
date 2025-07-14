# Stage 1: Build the React demo app
FROM node:18-alpine AS build

WORKDIR /app
COPY . .
RUN npm install
RUN npm run build:demo   # ✅ Fixed line

# Stage 2: Serve with Nginx
FROM nginx:alpine
COPY --from=build /app/demo/public /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
