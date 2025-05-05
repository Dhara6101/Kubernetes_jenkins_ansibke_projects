# Use the official Apache HTTP Server image as the base
FROM httpd:2.4

# Copy custom website content into the container
# Place your HTML files in the 'public-html' directory next to this Dockerfile
COPY ./public-html/ /usr/local/apache2/htdocs/

# Expose port 80
EXPOSE 80

# The httpd base image automatically runs Apache in the foreground, no CMD needed
