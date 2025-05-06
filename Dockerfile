
# Use the official NGINX base image
FROM nginx:alpine

# Copy custom HTML file to NGINX's default public directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# Start NGINX when the container launches
CMD ["nginx", "-g", "daemon off;"]
