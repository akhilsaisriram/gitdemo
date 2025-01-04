# Use a Node.js base image
FROM node:22-alpine

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the source code
COPY . .

# Expose the port your Node.js server listens on
EXPOSE 5000

# Start the Node.js server
CMD ["npm", "run", "server"]
