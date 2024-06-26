FROM node:20

WORKDIR /app

COPY . . 

RUN npm i 

RUN npx prisma generate

RUN npm run build

CMD ["node", "dist/index.js"]