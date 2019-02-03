#!/usr/bin
#https://github.com/cuber/ngx_http_google_filter_module/blob/master/README.zh-CN.md  

wget http://nginx.org/download/nginx-1.7.8.tar.gz
wget "ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.38.tar.gz"
wget "https://www.openssl.org/source/openssl-1.0.1j.tar.gz"
wget "https://www.zlib.net/zlib-1.2.11.tar.gz"
git clone https://github.com/cuber/ngx_http_google_filter_module
git clone https://github.com/yaoweibin/ngx_http_substitutions_filter_module

tar -xvpzf nginx-1.7.8.tar.gz
tar xzvf pcre-8.38.tar.gz
tar xzvf openssl-1.0.1j.tar.gz
tar xzvf zlib-1.2.11.tar.gz

cd nginx-1.7.8
./configure \
  --prefix=/opt/nginx-1.7.8 \
  --with-pcre=../pcre-8.38 \
  --with-openssl=../openssl-1.0.1j \
  --with-zlib=../zlib-1.2.11 \
  --with-http_ssl_module \
  --add-module=../ngx_http_google_filter_module \
  --add-module=../ngx_http_substitutions_filter_module

make install 

cd /opt/nginx-1.7.8/conf

mkdir vhost
echo "server {
  # ... part of server configuration
  server_name 45.76.157.234;
  listen 80;
  resolver 8.8.8.8;
  location / {
    google on;
    google_scholar on;
#    google_mail on;
  }
  # ...
}"  > google.conf

echo "replace /opt/nginx-1.7.8/conf/vhost/google.conf host address!"
echo "run /opt/nginx-1.7.8/sbin/nginx"
echo "run /opt/nginx-1.7.8/sbin/nginx -s reload"

echo "edit  /opt/nginx-1.7.8/conf/nginx.conf in location part, below index.html, index.htm;
add:
google on;
google_scholar on;"
