# Use the official Node.js LTS image
FROM node:18-alpine as builder

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Copy the rest of the application code
COPY . .

# Install dependencies
RUN npm install
# If you are using TypeScript, install ts-node globally
RUN npm install -g ts-node typescript

FROM node:18-alpine AS runner

# Set the working directory
WORKDIR /app
# Copy only the necessary files from the builder stage
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/tsconfig.json ./



# Expose the port your app runs on (change if needed)
EXPOSE 3000

# Server the application
CMD ["node", "Server.js"]