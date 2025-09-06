# Build stage
FROM golang:1.22 AS builder
WORKDIR /app
COPY app/ .
RUN go mod init kubetes-app && go mod tidy
RUN go build -o kubetes main.go

# Run stage (distroless for security)
FROM gcr.io/distroless/base
WORKDIR /
COPY --from=builder /app/kubetes .
EXPOSE 8089
CMD ["./kubetes"]
