FROM lsiobase/alpine:3.15
#Add addiitional packages
RUN apk add --no-cache curl
ARG TARGETARCH
ARG BUILDDATE
ENV BUILDDATEENV=${BUILDDATE}

LABEL \
    app.deemix.image.created="${BUILDDATE}" \
    app.deemix.image.url="https://gitlab.com/Bockiii/deemix-docker" \
    app.deemix.image.title="Docker image for Deemix" \
    app.deemix.image.description="Docker image for Deemix" \
    maintainer="Bocki"

#RUN curl -L -o deemix.zip http://gitlab.com/Bockiii/deemix-src/-/jobs/artifacts/master/download?job=dl_src && \
#    unzip deemix

# Need look again in project num
RUN curl -L https://gitlab.com/api/v4/projects/33610953/packages/generic/deemix-docker/static/deemix-server-linux-$TARGETARCH -o deemix-server

COPY root/ /

EXPOSE 6595
ENTRYPOINT [ "/init" ]
