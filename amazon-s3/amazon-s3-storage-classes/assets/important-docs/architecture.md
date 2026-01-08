# CloudCart – Static Website Architecture (AWS S3)

## 1. Overview

This document describes the architecture of the **CloudCart** static website hosted on Amazon S3.  
The goal is to provide a simple, low-cost, and highly available architecture suitable for learning and experimentation.

## 2. Architecture Components

- **Amazon S3**
  - Hosts static website assets (HTML, CSS, JS, images)
  - Website endpoint enabled

- **Optional: Amazon CloudFront**
  - CDN layer for caching and HTTPS

- **IAM**
  - Bucket policy for public read access
  - Restricted write permissions for administrators

## 3. Data Flow

1. User accesses the website URL
2. Request is served directly from S3 static website endpoint
3. Static assets are returned to the client
4. *(Optional)* Requests are cached and served via CloudFront

## 4. High Availability

- Amazon S3 provides built-in redundancy
- No single point of failure
- No servers to manage

## 5. Limitations

- No server-side processing
- No native authentication
- Forms require external services (API Gateway + Lambda)

## 6. Use Cases

- Static websites
- Documentation hosting
- Learning AWS fundamentals
