FROM node:20

WORKDIR /app

# Enable yarn
RUN corepack enable && corepack prepare yarn@stable --activate

# Copy all files
COPY . .

# Run install script with bash
RUN chmod +x ./install.sh && bash ./install.sh

# Expose the port
EXPOSE 4099

CMD ["sh", "-c", "yarn run solidbench-serve"]
