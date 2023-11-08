FROM timescale/timescaledb:latest-pg15

WORKDIR /tmp/pgvector

COPY ./pgvector .

RUN apk update && apk add g++ && apk add make && apk add llvm15 && apk --no-cache add clang15
RUN cd /tmp/pgvector 
RUN make clean  && make OPTFLAGS="" && make install 
RUN mkdir -p /usr/share/doc/pgvector 
RUN cp LICENSE README.md /usr/share/doc/pgvector 
RUN rm -r /tmp/pgvector 
RUN rm -rf /var/lib/apt/lists/*
