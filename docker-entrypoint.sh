#!/bin/bash
set -e

export NODE_ENV=production
export silent=false
export daemon=false

ls 
npm install nodebb-plugin-poll
npm install nodebb-plugin-google-analytics
npm install nodebb-plugin-emoji-extended
npm install nodebb-plugin-emoji-one
cd node_modules/nodebb-plugin-sso-coderdojo && npm install
cd ../nodebb-theme-cd-persona && npm install
cd ../nodebb-plugin-write-api && npm install
cd ../../


exec "$@"
