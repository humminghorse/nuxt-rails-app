FROM node:8.12-slim

WORKDIR /app/frontend

ENV PATH /app/frontend/node_modules/.bin:$PATH

RUN apt-get update -qq  \
  && rm -rf /var/lib/apt/lists/*

ENV TZ Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY package.json /app/frontend/package.json
COPY yarn.lock /app/frontend/yarn.lock

RUN yarn install --no-progress --registry http://registry.npmjs.org/
ENV HOST 0.0.0.0
