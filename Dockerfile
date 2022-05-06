FROM golang:1.18-bullseye as build
WORKDIR /app
COPY . /app
RUN go get -d -v .
RUN CGO_ENABLED=0 go build -o dist/gha_get_token

FROM gcr.io/distroless/static-debian11
COPY --from=build /app/dist/gha_get_token /
CMD ["/gha_get_token"]
