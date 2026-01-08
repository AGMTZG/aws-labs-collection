# CloudCart – AWS Cost Estimation

## 1. Scope

This estimate covers a static website hosted on Amazon S3 with optional logging and backups.

## 2. Estimated Monthly Costs

| Service                  | Usage              | Estimated Cost   |
|--------------------------|--------------------|------------------|
| Amazon S3 Storage        | ~30 MB             | ~$0.01           |
| S3 Requests              | Low traffic        | ~$0.01           |
| Access Logs              | Minimal            | ~$0.01           |
| Backups (S3 Standard)    | ~15 MB             | ~$0.01           |

**Estimated Total:** < $0.05 USD / month

## 3. Cost Optimization

- Use lifecycle rules to move logs to Glacier
- Delete outdated backups
- Avoid unnecessary CloudFront invalidations

## 4. Free Tier Considerations

- Fully covered under AWS Free Tier
- Ideal for students and labs

## 5. Cost Risks

- High traffic without CloudFront caching
- Storing large logs indefinitely
