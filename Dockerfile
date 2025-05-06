# Use Nginx Alpine as the base image
FROM nginx:alpine

# Install required packages: zip and unzip (Alpine uses apk for package management)
RUN apk add --no-cache zip unzip

# Add the Viking template from the new URL
ADD https://www.free-css.com/free-css-templates/viking.zip /usr/share/nginx/html/

# Change directory to the location of the template
WORKDIR /usr/share/nginx/html/

# Extract the Viking template
RUN unzip viking.zip && cp -rvf viking/* . && rm -rf viking viking.zip

# Expose HTTP and HTTPS ports
EXPOSE 80 443

# Command to run Nginx in the foreground (this is already the default in the Nginx image)
CMD ["nginx", "-g", "daemon off;"]

