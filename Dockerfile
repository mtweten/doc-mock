FROM hugomods/hugo:exts AS builder  
WORKDIR /src  
COPY . .  
RUN hugo --minify  

# FROM httpd:2.4-alpine  
# COPY --from=builder /src/public/ /usr/local/apache2/htdocs/  
# EXPOSE 80  

# Stage 2: Serve the static site with Nginx
FROM nginx:alpine

# Copy the built static files from the builder stage
COPY --from=builder /src/public /usr/share/nginx/html

# Expose port 80 for web traffic
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
