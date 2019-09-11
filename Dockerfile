FROM alpine/git
COPY . /data
WORKDIR /data

## MAM: Removing the theme work on 10-Sep-2019 since the theme is no longer a submodule (that was tripping up Travis CI)
# RUN rm -rf themes/*
# RUN git clone https://github.com/SummittDweller/internet-weblog.git themes/internet-weblog

##

FROM klakegg/hugo:0.55.6-ext-alpine
# FROM skyscrapers/hugo:0.48
# FROM skyscrapers/hugo:0.46
COPY --from=0 /data /data
WORKDIR /data
RUN hugo

##
#
#FROM mysocialobservations/docker-tdewolff-minify
#COPY --from=1 /data/public /data/public
#WORKDIR /data
#RUN minify --recursive --verbose \
#        --match=\.*.js$ \
#        --type=js \
#        --output public/ \
#        public/
#
#WORKDIR /data
#RUN minify --recursive --verbose \
#        --match=\.*.css$ \
#        --type=css \
#        --output public/ \
#        public/
#
#WORKDIR /data
#RUN minify --recursive --verbose \
#        --match=\.*.html$ \
#        --type=html \
#        --output public/ \
#        public/
#
##

FROM nginx:alpine
#COPY --from=2 /data/public /usr/share/nginx/html
COPY --from=1 /data/public /usr/share/nginx/html
#LABEL maintainer Mark A. McFate <mcfatem@grinnell.edu>
#COPY ./conf/default.conf /etc/nginx/conf.d/default.conf
#COPY --from=2 /data/public /var/www/site
#WORKDIR /var/www/site
