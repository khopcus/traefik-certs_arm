FROM golang:1.13-alpine as builder

# Setup
RUN mkdir /app
WORKDIR /app

# Add libraries
RUN apk add --no-cache git && \
  go get "github.com/fsnotify/fsnotify" && \
  apk del git

# Copy & build
ADD . /app/
RUN CGO_ENABLED=0 GOOS=linux GOARCH=arm GOARM=7 go build -a -installsuffix nocgo -o /traefik-certs_arm .

# Copy into scratch container
FROM scratch
COPY --from=builder /traefik-certs_arm ./
ENTRYPOINT ["./traefik-certs_arm"]
