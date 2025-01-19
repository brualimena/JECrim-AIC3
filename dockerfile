# Use uma imagem base do Node.js
FROM node:18

# Defina o diretório de trabalho no container
WORKDIR /usr/src/app

# Copie o package.json e o package-lock.json para o container
COPY package*.json ./

# Instale as dependências
RUN npm install

# Copie o restante dos arquivos do projeto, incluindo a pasta database/prisma
COPY . .

# Gera o Prisma Client, especificando o caminho correto para o schema.prisma
RUN npx prisma generate --schema=./database/prisma/schema.prisma

# Compile o projeto
RUN npm run build

# Exponha a porta onde a aplicação irá rodar
EXPOSE 3000

# Comando para rodar a aplicação
CMD ["npm", "run", "start:prod"]
