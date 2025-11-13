# --- Stage 1: Building the Application ---
FROM golang:1.22 AS builder
WORKDIR /app 
COPY . . 
RUN go build -o myapp main.go

# --- Stage 2: Serve the Application ---
FROM alpine:latest
COPY --from=builder /app/myapp /usr/local/bin/myapp
CMD /usr/local/bin/myapp