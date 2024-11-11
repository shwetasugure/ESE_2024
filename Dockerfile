
# Use Node.js base image
FROM node:14

# Set working directory
WORKDIR /usr/src/app

# Install dependencies
COPY app/package*.json ./
RUN npm install

# Copy app source code
COPY app/ .

# Expose port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
