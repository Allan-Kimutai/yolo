# Use the official Node.js 16 image as a base for the build stage
FROM node:16 as build


# Set the working directory inside the container
WORKDIR /app/backend


# Copy package.json and package-lock.json to the working directory
COPY package*.json ./


# Install dependencies
RUN npm install


# Copy the rest of the application code
COPY . .


# Use a lightweight Node.js image for the production stage
FROM node:16-alpine


# Set the working directory inside the container
WORKDIR /app/backend


# Copy the build output from the build stage
COPY --from=build /app/backend .


# Expose the port the app runs on
EXPOSE 5000


# Command to run the application
CMD ["npm", "start"]
