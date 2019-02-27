FROM alpine:latest as builder
RUN apk --no-cache add \
	build-base \
	git \
	openssl-dev \
	zlib-dev

COPY Makefile .
RUN make build

FROM alpine:latest as runtime
RUN apk --no-cache add \
        ca-certificates \
	libgcc \
	libstdc++
COPY --from=builder /usr/src/wrk2/wrk /bin/wrk
ENTRYPOINT ["/bin/wrk"]
