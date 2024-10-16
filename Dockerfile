# Use an official Node.js image as a parent image
FROM node:16-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the React app for production
RUN npm run build

# Use a simple web server to serve the static files
RUN npm install -g serve

# Expose port 3000 to the host
EXPOSE 3000

# Command to run the application
CMD ["serve", "-s", "build", "-l", "3000"]

