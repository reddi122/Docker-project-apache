Deploy a Simple Static Website Using Docker & Nginx
This guide will walk you through step-by-step on how to deploy a static website using Nginx inside a Docker container.

📌 Step 1: Create a Project Directory



mkdir nginx-static-app
cd nginx-static-app
This will be your project folder.

📌 Step 2: Create a Simple HTML File
Inside your project folder, create a file named index.html.




nano index.html
Add the following HTML content:

html


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Docker + Nginx</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 100px;
        }
    </style>
</head>
<body>
    <h1>🚀 Hello, Docker & Nginx! 🎉</h1>
    <p>This is a static website running inside a Docker container.</p>
</body>
</html>
Save and exit (CTRL + X, then Y, then ENTER).

📌 Step 3: Create an Nginx Configuration File
Now, create a new file called default.conf inside a nginx folder.




mkdir nginx
nano nginx/default.conf
Paste this inside:

nginx


server {
    listen 80;
    server_name localhost;

    location / {
        root /usr/share/nginx/html;
        index index.html;
    }
}
🔹 This configuration:

Tells Nginx to serve the index.html file from /usr/share/nginx/html.

Listens on port 80 for incoming connections.

📌 Step 4: Create a Dockerfile
Now, create a Dockerfile inside your project folder.




nano Dockerfile
Add the following content:

dockerfile


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

📌 Step 5: Build the Docker Image
Now, build your Docker image using the following command:




docker build -t my-nginx-app .
🔹 Explanation:

docker build -t my-nginx-app . → Creates a Docker image named my-nginx-app using the current directory (.).

📌 Step 6: Run the Docker Container
Run your container using:




docker run -d -p 8080:80 --name my-nginx-container my-nginx-app
🔹 Explanation:

-d → Runs the container in detached mode.

-p 8080:80 → Maps port 8080 on the host to port 80 in the container.

--name my-nginx-container → Assigns a name to the container.

my-nginx-app → Uses the Docker image we built.

📌 Step 7: Verify the Deployment
Open your browser and go to:

🔗 http://localhost:8080

You should see your static web page! 🎉

📌 Step 8: View Running Containers
Check if the container is running:




docker ps
📌 Step 9: Stopping & Removing the Container
If you want to stop the container:




docker stop my-nginx-container
To remove the container:




docker rm my-nginx-container
To remove the image:




docker rmi my-nginx-app
📌 Step 10: Deploying with Docker Compose (Optional)
If you prefer Docker Compose, create a docker-compose.yml file:




nano docker-compose.yml

version: '3'
services:
  nginx:
    image: my-nginx-app
    build: .
    ports:
      - "8080:80"
    container_name: my-nginx-container
Run:
docker-compose up -d
🚀 Your website is now deployed using Docker Compose!

Summary
✅ Created a static website
✅ Built a Docker image with Nginx
✅ Deployed it inside a Docker container
✅ Exposed it on port 8080
✅ Verified the deployment
