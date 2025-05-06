FROM centos:7

# Install Nginx, zip, and unzip
RUN yum install -y nginx \
    zip \
    unzip \
    && yum clean all

# Download and extract the Viking template
ADD https://www.free-css.com/assets/files/free-css-templates/download/page285/viking.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip viking.zip \
    && cp -rvf viking/* . \
    && rm -rf viking viking.zip

# Nginx runs in the foreground mode
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

# Expose HTTP and HTTPS ports
EXPOSE 80 443

# Copy custom Nginx configuration if necessary (Optional)
# ADD nginx.conf /etc/nginx/nginx.conf

