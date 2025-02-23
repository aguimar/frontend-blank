# Dockerfile
FROM node:20-slim

# Install git for potential package installations
RUN apt-get update && apt-get install -y git

WORKDIR /app

# We'll keep the container running and execute commands through it
CMD ["sleep", "infinity"]
