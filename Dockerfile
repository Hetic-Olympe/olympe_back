# Use Node.js version 14 as base image
FROM node:14

# Set working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all application files to container
COPY . .

# Expose port 3000 (the port your Express app will listen on)
EXPOSE 3000

# Command to run your application
CMD ["node", "app.js"]
