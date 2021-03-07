FROM golang:1.16.0-alpine AS build
WORKDIR /
COPY main.go .
RUN GOOS=linux go build -o webby *.go

FROM alpine:3  
RUN apk --no-cache add ca-certificates
WORKDIR /
EXPOSE 5000
COPY --from=build /webby .
CMD ["/webby"]  
