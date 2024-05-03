# Use the official Node.js 14 image as a base for the build stage
FROM node:16-alpine as build


# Set the working directory inside the container
WORKDIR /app/client


# Copy package.json and package-lock.json to the working directory
COPY package*.json ./


# Install dependencies
RUN npm install


# Copy the rest of the application code
COPY . .


# Build the React app
RUN npm run build


# Use a lightweight Node.js image for the production stage
FROM node:16-alpine


# Set the working directory inside the container
WORKDIR /app/client


# Copy the build output from the build stage and the package*.json file
COPY --from=build /app/client/build ./build
COPY --from=build /app/client/package.json /app/client/package-lock.json ./


RUN npm install -g serve
# Expose the port the app runs on
EXPOSE 3000


# Command to run the application
CMD ["serve","-s","build"]