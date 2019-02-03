#!/usr/bin
#https://github.com/cuber/ngx_http_google_filter_module/blob/master/README.zh-CN.md  ¾µÏñ´î½¨


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
