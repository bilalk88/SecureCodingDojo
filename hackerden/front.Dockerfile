# Copyright 2023 VMware, Inc.
# SPDX-License-Identifier: Apache-2.0	
FROM node:18-alpine

RUN apk upgrade
ADD front /home/node/app
WORKDIR /home/node/app

RUN npm install
RUN npm install pm2@latest -g

EXPOSE 3000
ENTRYPOINT ["pm2","start","/home/node/app/server.js","--no-daemon"]
