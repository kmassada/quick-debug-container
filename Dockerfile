FROM ubuntu

ARG CLOUD_SDK_VERSION=240.0.0
ENV CLOUD_SDK_VERSION=$CLOUD_SDK_VERSION
RUN apt-get update && apt-get install -qqy \
    curl \
    dnsutils && \
    export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
    echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" > /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update && \
    apt-get install -y google-cloud-sdk=${CLOUD_SDK_VERSION}-0 \
        kubectl && \
    gcloud --version && \
    kubectl version --client
