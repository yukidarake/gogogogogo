FROM golang:1.10 as builder
ENV CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64
WORKDIR /tmp/workspace
COPY . .
RUN make

FROM alpine:3.8
RUN apk --no-cache --update add tzdata ca-certificates && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime 
COPY --from=builder /tmp/workspace/build/app /app
EXPOSE 55555
ENTRYPOINT ["/app"]
