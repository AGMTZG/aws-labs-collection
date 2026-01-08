# CloudCart – Security and Access Policy

## 1. Purpose

This document defines the security rules and best practices applied to the **CloudCart** S3 static website.

## 2. Public Access

- **Public read access** is allowed **only** for website content  
- **Public write access** is **strictly forbidden**  
- **AWS Block Public Access** settings must be carefully reviewed

## 3. IAM Policies

### Admin users
- Full access to S3 bucket objects

### Read-only users
- `s3:GetObject` permission only

### Logs bucket
- Write-only permissions from the S3 logging service

## 4. Bucket Policy Principles

- **Least privilege** principle
- **Explicit allow** only for `GetObject`
- **No wildcard** write permissions

## 5. Common Security Risks

- Accidentally exposing `.env` or configuration files
- Disabling **Block Public Access** without fully understanding the bucket policy
- Using **root account** credentials for daily operations

## 6. Recommendations

- Enable **S3 access logging**
- **Regularly review** bucket policies and IAM permissions
- Use **CloudFront + HTTPS** for production environments
