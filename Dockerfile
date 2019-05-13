FROM nodebb/docker:v1.10.2

RUN mkdir -p /usr/src/app/node_modules/nodebb-plugin-sso-coderdojo
RUN mkdir -p /usr/src/app/node_modules/nodebb-theme-cd-persona
RUN mkdir -p /usr/src/app/node_modules/nodebb-plugin-write-api
RUN npm install nodebb-plugin-poll
RUN npm install nodebb-plugin-google-analytics
RUN npm install nodebb-plugin-emoji-extended
RUN npm install nodebb-plugin-emoji-one
COPY ./config.json /usr/src/app/config.json
