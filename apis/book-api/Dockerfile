FROM node:12.13.0-alpine3.10

WORKDIR /app
COPY ./apis/book-api/app /app
RUN npm i
CMD [ "npm", "start" ]