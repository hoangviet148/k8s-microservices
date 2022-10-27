FROM node:12.13.0-alpine3.10

WORKDIR /app
RUN echo $PWD
COPY app /app
RUN npm i
CMD [ "npm", "start" ]