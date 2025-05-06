
FROM nginx:alpine
RUN apk add --no-cache zip unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page285/viking.zip /usr/share/nginx/html/
WORKDIR /usr/share/nginx/html/
RUN unzip viking.zip && cp -rvf viking/* . && rm -rf viking viking.zip
EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
