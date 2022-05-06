FROM golang:1.18-bullseye as build
WORKDIR /app
COPY . /app
RUN go build -o dist/gha_get_token

FROM gcr.io/distroless/base-debian11
COPY --from=build /app/dist/gha_get_token /
CMD ["/gha_get_token"]
