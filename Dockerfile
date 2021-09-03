# -------------------------------------------------------------------
# Minimal dockerfile from alpine base
#
# Instructions:
# =============
# 1. Create an empty directory and copy this file into it.
#
# 2. Create image with: 
#	docker build --tag timeoff:latest .
#
# 3. Run with: 
#	docker run -d -p 3000:3000 --name alpine_timeoff timeoff
#
# 4. Login to running container (to update config (vi config/app.json): 
#	docker exec -ti --user root alpine_timeoff /bin/sh
# --------------------------------------------------------------------

FROM node:14
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install  https://github.com/mapbox/node-sqlite3/tarball/master
RUN npm install
COPY . ./
EXPOSE 3000
CMD ["npm", "start"]
