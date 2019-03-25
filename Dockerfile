FROM ubuntu

RUN apt-get update && apt-get install -qy curl dnsutils
