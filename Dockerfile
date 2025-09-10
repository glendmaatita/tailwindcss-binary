FROM alpine:latest AS downloader
RUN apk add --no-cache jq
RUN wget -O tailwindcss https://github.com/tailwindlabs/tailwindcss/releases/download/v3.3.2/tailwindcss-linux-x64 \
    && chmod u+x tailwindcss

FROM scratch
COPY --from=downloader tailwindcss tailwindcss
ENTRYPOINT [ "/tailwindcss" ]