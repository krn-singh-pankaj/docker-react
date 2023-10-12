# Stage - 1

FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Stage - 2

FROM nginx
# Copying output of Stage-1 output 
COPY --from=builder /app/build /usr/share/nginx/html
# In case of nginx not required to setup default command, as container image would automatically start the nginx
