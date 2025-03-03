# 빌드 스테이지: 소스 코드 빌드
FROM node:20-alpine as build

WORKDIR /app

# 필수 패키지 설치
COPY package.json package-lock.json* ./
RUN npm ci

# 소스 코드 복사
COPY . .

# 환경 변수 설정
ARG VITE_API_URL
ARG VITE_BACKEND_API_VERSION
ENV VITE_API_URL=$VITE_API_URL
ENV VITE_BACKEND_API_VERSION=$VITE_BACKEND_API_VERSION

# 애플리케이션 빌드
RUN npm run build

# 실행 스테이지: Nginx를 사용하여 빌드된 파일 제공
FROM nginx:alpine

# Nginx 설정 복사
COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf

# 빌드된 앱 파일 복사
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"] 