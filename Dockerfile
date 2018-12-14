#Tagging as builder phase
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . . 

RUN npm run build

#At this stage, all the files will be in /app/build 

#Now start the run build phase assuming that the image is already built into /app/build
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html