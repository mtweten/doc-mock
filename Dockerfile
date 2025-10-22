FROM hugomods/hugo:exts AS builder  
WORKDIR /src  
COPY . .  
RUN hugo --minify  

FROM httpd:2.4-alpine  
COPY --from=builder /src/public/ /usr/local/apache2/htdocs/  
EXPOSE 80  
