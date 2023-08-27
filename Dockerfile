FROM node:14.21.3-alpine

WORKDIR /opt/mx-puppet-instagram
RUN apk add \
	python3 \
	pkgconfig \
	build-base \
	g++ \
	cairo-dev \
	jpeg-dev \
	pango-dev \
	giflib-dev

COPY package.json .
RUN yarn install
COPY . .
RUN yarn build

VOLUME /data

ENV CONFIG_PATH=/data/config.yaml \
    REGISTRATION_PATH=/data/instagram-registration.yaml

ENTRYPOINT ["/opt/mx-puppet-instagram/docker-run.sh"]
