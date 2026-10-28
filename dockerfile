FROM node:22-alpine

WORKDIR /usr/src/app

# Copia os arquivos de dependência
COPY package*.json ./

# Instala as dependências
RUN npm ci

# Copia o restante do código do projeto
COPY . .

# Se o seu projeto for em TypeScript e precisar compilar antes de rodar, 
# certifique-se de que o comando "npm run build" gera a pasta de build correta.
# (Descomente a linha abaixo se necessário):
# RUN npm run build

# O Render injeta a porta automaticamente, mas definimos uma padrão de fallback
ENV PORT=2567
EXPOSE 2567

# Inicia o servidor conforme configurado no package.json
CMD [ "npm", "start" ]
