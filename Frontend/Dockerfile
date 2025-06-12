# Stage 1: Build the app
FROM node:18-alpine AS builder
WORKDIR /app

# Copy project files
COPY . .

# Install dependencies and build
RUN npm install && npm run build

# Stage 2: Serve with Nginx
FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Run nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
