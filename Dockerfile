
FROM centos:7

# Install Nginx, zip, and unzip
RUN yum install -y nginx \
    zip \
    unzip \
    && yum clean all

# Download and extract the Finexo template
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/finexo.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip finexo.zip \
    && cp -rvf finexo/* . \
    && rm -rf finexo finexo.zip

# Nginx runs in the foreground mode
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

# Expose HTTP and HTTPS ports
EXPOSE 80 443

# Copy custom Nginx configuration if necessary (Optional)
# ADD nginx.conf /etc/nginx/nginx.conf
