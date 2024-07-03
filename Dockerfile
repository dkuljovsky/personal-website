FROM node:19-alpine3.17 as builder
ADD . /app
WORKDIR /app
RUN npm install
RUN npm run build
RUN apk add curl

FROM node:19-alpine3.17 as runner
COPY --from=builder /app/.output/ /app/

EXPOSE 3000
CMD ["node", "/app/server/index.mjs"]