FROM golang:alpine as build
WORKDIR /app
COPY . .
RUN go build -o hello-world hello-world.go

FROM scratch
COPY --from=build /app/hello-world /
WORKDIR /
ENTRYPOINT ["./hello-world"]