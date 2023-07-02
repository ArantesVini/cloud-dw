FROM arm64v8/ubuntu:latest

RUN apt-get update && \
    apt-get install -y curl nano wget unzip gnupg software-properties-common openssl

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install --update

RUN curl "https://releases.hashicorp.com/terraform/0.14.11/terraform_0.14.11_linux_amd64.zip" -o "terraform.zip" && \
    unzip terraform.zip && \
    mv terraform /usr/local/bin/