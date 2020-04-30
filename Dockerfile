FROM node:10.16.0

LABEL maintainer="Robert <robertzhangwenjie@gmail.com>"

COPY ./ ./vue_shop_api
WORKDIR ./vue_shop_api

ENV NODE_PORT=8080

EXPOSE 8080
RUN npm install 

CMD npm run start
