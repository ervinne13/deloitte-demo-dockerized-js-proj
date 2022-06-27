FROM node:14

WORKDIR /var/www/deloitte/backend

COPY backend/package.json ./
COPY *backend/package-lock.json ./

RUN npm i
# RUN npm audit fix # Let's disable this for local, this process is too slow

# Basically let's just make the node modules available on host
# We've set the context to / so we need to specify the host folder below
COPY backend/ ./

EXPOSE 3000

CMD ["npm", "start"]