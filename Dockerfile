FROM alpine

RUN apk --no-cache add ruby tidyhtml zip \
  && mkdir /build

WORKDIR /build
