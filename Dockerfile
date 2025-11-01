FROM node:20

# Install Docker and git
RUN apt-get update && \
    apt-get install -y git

WORKDIR /app

# Enable yarn
RUN corepack enable && corepack prepare yarn@stable --activate

# Copy all files
COPY . .

# Initialize and update git submodules
RUN git submodule update --init --recursive

# Run install script with bash
RUN chmod +x ./install.sh && bash ./install.sh

# Expose the port
EXPOSE 4099

CMD ["sh", "-c", "yarn run solidbench-serve"]
