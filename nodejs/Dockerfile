FROM node:alpine

# Install curl for health checks
RUN apk add --no-cache curl

WORKDIR /app

COPY package*.json ./
RUN npm install

# Then copy the rest
COPY . .

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD curl -f http://localhost:3000/health || exit 1

CMD ["npm", "start"]


# Start your container
# docker run -d --name my-app my-node-app

# Check its health status
# docker ps

# Get more detailed health info
# docker inspect my-app | grep Health