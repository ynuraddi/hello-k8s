FROM golang:1.23-alpine AS builder

WORKDIR /app

RUN mkdir -p /app

COPY go.mod /app/

RUN go mod download

COPY . /app/

RUN go build -o hello-k8s

FROM scratch

COPY --from=builder /app/hello-k8s .

EXPOSE 8080

CMD ["/hello-k8s"]