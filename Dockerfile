
# Use CentOS 7 as the base image
FROM centos:7

# Update the repositories to use a different mirror
RUN sed -i 's|http://mirror.centos.org|http://mirror.rackspace.com|g' /etc/yum.repos.d/CentOS-Base.repo

# Install Nginx, zip, and unzip
RUN yum install -y nginx zip unzip && yum clean all

# Add template files to the web server directory
ADD https://www.free-css.com/assets/files/free-css-templates/download/page285/viking.zip /usr/share/nginx/html/

# Extract the Viking template and clean up
WORKDIR /usr/share/nginx/html/
RUN unzip viking.zip && cp -rvf viking/* . && rm -rf viking viking.zip

# Expose the ports for HTTP and HTTPS
EXPOSE 80 443

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]

