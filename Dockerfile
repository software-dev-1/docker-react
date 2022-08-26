FROM node:16-alpine as builder

WORKDIR /usr/app

COPY package.json .
RUN npm install
# Here we do not COPY command as source code is already present in local and not in container
COPY . .

RUN npm run build

FROM nginx
COPY --from=builder /usr/app/build /usr/share/nginx/html
# Copy from earlier stage(builder) to current stage



# docker run -p 8080:80 13a6ed7b8fad3b89db6e4dde1a13afcec50
# Default nginx port is 80