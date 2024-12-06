# Build stage
FROM node:18 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (if present)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire app files (except those in .dockerignore)
COPY . .

# Build the React application
RUN npm run build

# Nginx stage
FROM nginx:alpine

# Copy the build files from the build stage to Nginx's public directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 for the container
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
