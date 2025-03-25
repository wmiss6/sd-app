FROM node:18

# Install necessary tools
RUN apt-get update && apt-get install -y \
    curl \
    git \
    jq \
    && rm -rf /var/lib/apt/lists/*

# Install Forge CLI
RUN npm install -g @forge/cli

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Expose port for tunnel
EXPOSE 3000

# Default command to start a shell
CMD ["/bin/bash"]
