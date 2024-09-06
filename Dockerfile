# Use uma imagem base do Node.js
FROM node:18

# Define o diretório de trabalho dentro do contêiner
WORKDIR /usr/src/app

# Instala o pnpm
RUN npm install -g pnpm

# Copia os arquivos de configuração e código fonte
COPY package*.json ./
COPY pnpm-lock.yaml ./
COPY src/ ./src
COPY public/ ./public
COPY tsconfig.json ./

# Instala as dependências
RUN pnpm install

# Compila o código TypeScript e copia arquivos estáticos
RUN pnpm run build

RUN ls -la /usr/src/app/dist

# Expõe a porta que a aplicação irá usar
EXPOSE 3000

# Define o comando para iniciar a aplicação
CMD ["pnpm", "run","start"]
