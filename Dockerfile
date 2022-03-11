FROM alpine:3.15

RUN apk --no-cache --update add privoxy wget ca-certificates

COPY config /etc/privoxy/config
RUN chown privoxy.privoxy /etc/privoxy/*

EXPOSE 8118
HEALTHCHECK --interval=30s --timeout=3s CMD nc -z localhost 8118

ENTRYPOINT ["privoxy"]
CMD ["--no-daemon","--user","privoxy","/etc/privoxy/config"]