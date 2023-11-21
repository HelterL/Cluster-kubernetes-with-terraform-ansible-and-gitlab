FROM ubuntu:20.04
RUN apt update && \
    apt install ansible wget unzip -y && \
    apt install software-properties-common -y && \
    apt-add-repository universe &&\
    apt update -y && \
    apt install python3 -y && \
    apt install python3-pip -y && \
    pip install boto3 botocore &&\
    wget https://releases.hashicorp.com/terraform/1.6.4/terraform_1.6.4_linux_amd64.zip && \
    unzip terraform_1.6.4_linux_amd64.zip -d /usr/bin 