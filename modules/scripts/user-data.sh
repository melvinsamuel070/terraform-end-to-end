#!/bin/bash

# Install Nginx
yum update -y
amazon-linux-extras install nginx1 -y

# Start Nginx
systemctl start nginx
systemctl enable nginx

# Create simple HTML page
cat <<EOF > /usr/share/nginx/html/index.html
<html>
<head>
    <title>My Web App</title>
</head>
<body>
    <h1>Hello from Terraform!</h1>
    <p>This server was deployed automatically.</p>
</body>
</html>
EOF