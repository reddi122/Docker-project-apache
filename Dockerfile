# Step 1: Use the official Nginx image
FROM nginx:latest

# Step 2: Copy your static files into the Nginx web directory
COPY index.html /usr/share/nginx/html/index.html

# Step 3: Copy the Nginx configuration file
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# Step 4: Expose port 80
EXPOSE 80

# Step 5: Start Nginx
CMD ["nginx", "-g", "daemon off;"]
