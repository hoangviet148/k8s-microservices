FROM node:12.13.0-alpine3.10

WORKDIR /app
COPY package.json ./
RUN npm i
COPY . .
RUN npm run dev-book &
RUN npm run dev-customer &
RUN npm run dev-order &