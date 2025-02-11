# Stage 1: React App build (nodejs)
FROM node:22 AS build

WORKDIR /app

# 의존성 설치
COPY package*.json .
RUN npm install

# 소스 카피
# 현재 디렉토리 -> 작업 디렉토리
COPY . .

# production 빌드 생성
RUN npm run build


# Stage 2: React App Service (nginx)
FROM nginx:alpine

COPY --from=build /app/dist /usr/share/nginx/html

# 포트 노출
EXPOSE 80

# 실행
ENTRYPOINT ["nginx", "-g", "daemon off;"]

# build
# docker build -t react-cart .