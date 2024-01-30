FROM node:14-alpine
ARG GITHUB_ACCESS_TOKEN
ARG GITHUB_BRANCH
ARG PATH_PREFIX
ARG HOST
ARG PORT
ARG GOOGLE_ANALYTICS_ID
ARG PWA_APP_NAME
ARG APP_NAME
ARG API_BASEURL
ARG EMPLOYER_LOGIN_URL
RUN sed -i 's/https/http/g' /etc/apk/repositories
RUN apk update && apk upgrade
RUN apk add git
RUN apk add --no-cache tzdata
ENV TZ Asia/Kuala_Lumpur
ENV PATH_PREFIX ${PATH_PREFIX}
ENV HOST ${HOST}
ENV PORT ${PORT}
ENV GOOGLE_ANALYTICS_ID ${GOOGLE_ANALYTICS_ID}
ENV PWA_APP_NAME ${PWA_APP_NAME}
ENV APP_NAME ${APP_NAME}
ENV API_BASEURL ${API_BASEURL}
ENV EMPLOYER_LOGIN_URL ${EMPLOYER_LOGIN_URL}
RUN mkdir -p /nuxt-app
WORKDIR /nuxt-app
RUN git config --global http.sslVerify false
RUN git clone -b ${GITHUB_BRANCH}  https://${GITHUB_ACCESS_TOKEN}@github.com/mystepPortal/mystep-frontend.git /nuxt-app
RUN npm config set strict-ssl false
RUN npm install
RUN npm run build