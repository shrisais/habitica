cat > /root/docker-compose.yml <<- "SCRIPT"

version: '3'
services:
  client:
    command: ["npm", "run", "client:dev"]
    depends_on:
      - server
    environment:
      - BASE_URL=http://server:3000
    image: shrisais5/habitica-base
    networks:
      - habitica
    ports:
      - "8080:8080"
    healthcheck:
      test: curl --fail http://localhost:8080 || exit 1
      # test: ["CMD", "curl", "-f", "http://localhost"]
      interval: 60s
      retries: 5
      timeout: 10s
  server:
    command: ["npm", "start"]
    depends_on:
      - mongo
    environment:
      - NODE_DB_URI=mongodb://mongo/habitrpg
    image: shrisais5/habitica-base
    networks:
      - habitica
    ports:
      - "3000:3000"
    healthcheck:
      test: curl --fail http://localhost:3000 || exit 1
      interval: 60s
      retries: 5
      timeout: 10s
  mongo:
    image: mongo:3.6
    ports:
      - "27017:27017"
    networks:
      - habitica

networks:
  habitica:
    driver: bridge


SCRIPT
