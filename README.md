# Nodebb dev with Docker

This is the dev and production setup for CoderDojo forums.
This is a NodeBB forum with a couple of plugins, including one private (plugin-sso-coderdojo)

## Preparation

`ln -s` or `git clone` all plugins and the current nodebb version into the root folder.
This is an example of an expected ls.
```
┌─╼[~/Public/nodebb-dev] [master*] 
└────╼ ls
total 56K
lrwxrwxrwx.  1 wardormeur wardormeur   26 Feb 26  2018 nodebb-theme-cd-persona -> ../nodebb-theme-cd-persona
lrwxrwxrwx.  1 wardormeur wardormeur   30 Oct 24  2018 nodebb-plugin-sso-coderdojo -> ../nodebb-plugin-sso-coderdojo
drwxr-xr-x. 11 wardormeur wardormeur 4.0K Oct 24  2018 NodeBB
lrwxrwxrwx.  1 wardormeur wardormeur   26 Nov  1  2018 nodebb-plugin-write-api -> ../nodebb-plugin-write-api
...
```

## Production

Ensure that the Dockerfile image install the plugins with npm
Example of command ran in prod:
```
docker run --rm
  --name=forums
  -v ~/NodeBB-docker/nodebb-plugin-sso-coderdojo:/usr/src/app/node_modules/nodebb-plugin-sso-coderdojo
  -v ~/NodeBB-docker/nodebb-plugin-write-api:/usr/src/app/node_modules/nodebb-plugin-write-api
  -v ~/NodeBB-docker/nodebb-theme-cd-persona:/usr/src/app/node_modules/nodebb-theme-cd-persona
  -v ~/NodeBB-docker/build:/usr/src/app/build
  -e ZEN_INTERNAL_URL=https://zen.coderdojo.com
  -e CODERDOJO_COMMUNITY_PLATFORM=https://zen.coderdojo.com
  -e A_CERTAIN_NAME_THAT_ISNT_PUBLIC=refer_to_prod
  -e A_SECRET_THAT_SHOULDNT_BE_PUBLIC=refer_to_prod
  -p 4567:4567
  forums ./nodebb build
```

## Development

Runs on cp-localdevelopment's network (might need tweaking depending on your OS, Mac apparently names it `cp_local_development`, run `docker network ls` to find the proper name)
Running `docker-compose up` should do it afterwards.
