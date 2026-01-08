# AWS Labs Collection

This repository contains a **small but growing collection of hands-on AWS labs** focused on learning by doing.

The goal of this project is educational: provide **practical, reproducible exercises** that help developers understand AWS concepts by running them first and then understanding how they work.

## Current Labs

At the moment, this repository includes early-stage labs such as:

- **S3 Static Website Hosting**  
  Deploying a basic static website using Amazon S3.

- **S3 Bucket Versioning**  
  Understanding how versioning works and how it protects object data.

- **S3 Storage Classes**
  Exploring the different Amazon S3 storage classes and understanding when each classshould be used based on cost and access patterns.

More labs will be added incrementally as they are refined and validated.

## Status

🚧 **Work in progress**

This repository is intentionally small for now.  
My current primary focus is maintaining and improving advanced Kubernetes scenarios on KillerCoda, while gradually expanding this AWS lab collection.

## Who This Is For

- Developers new to AWS who want hands-on experience
- Engineers who prefer learning by experimenting instead of reading theory only
- Students preparing for AWS or cloud-related certifications

## How to install localstack to practice:

LocalStack is a local development and testing tool that emulates AWS cloud services on your own machine, allowing developers to build, test, and debug AWS-based applications without connecting to the real AWS cloud or incurring costs. You will need Docker in order to run it. Then paste these commands into your terminal:

- docker pull localstack/localstack

- docker run --rm -it -p 4566:4566 -p 4571:4571 localstack/localstack

Note: Keep in mind that you will need another instance of the terminal or you can detach the container adding -d.

Or you can use docker-compose for more fleixibility:

```bash
services:
  localstack:
    image: localstack/localstack
    container_name: localstack_main
    ports:
      - "4566:4566"
      - "4571:4571"
    environment:
      - SERVICES=s3,dynamodb,lambda
      - DEBUG=1
      - DATA_DIR=/tmp/localstack/data
    volumes:
      - "./localstack-data:/tmp/localstack"
      - "/var/run/docker.sock:/var/run/docker.sock"
```
### Install aws cli


```bash
sudo apt update
sudo apt install unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

aws --version

```

### Add this to your bashrc 


```bash
vim ~/.bashrc

export AWS_ACCESS_KEY_ID=test
export AWS_SECRET_ACCESS_KEY=test
export AWS_DEFAULT_REGION=us-east-1
export AWS_ENDPOINT_URL=http://localhost:4566

# And then:

source ~/.bashrc

```

## Disclaimer

These labs are for **learning and experimentation purposes only**.  
They are not intended to represent production-ready architectures.

---

Maintained by **AGMTZG**
