# Step 1: Use the official Nginx image
FROM httpd:latest

# Step 2: Copy your static files into the Nginx web directory
COPY index.html /usr/local/apache2/htdocs/

# Step 3: Expose port 80
EXPOSE 80

# Explicit CMD (optional – already defined in base image)
# CMD ["httpd-foreground"]
