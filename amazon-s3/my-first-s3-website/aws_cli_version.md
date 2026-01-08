## Lab Steps - AWS CLI Version

### Step 1 – Create the S3 bucket

```bash
aws s3 mb s3://<your bucket name>

# Using the api:

aws s3api create-bucket --bucket my-bucket --region us-east-1
```

### Step 2 – Upload the files

```bash
# To upload one file
aws s3 cp ./  s3://<my bucket name>

# To upload everything in one command
aws s3 cp ./  s3://<my bucket name> --recursive

# For more efficient upload, use this command
aws s3 sync ./ s3://<my bucket name>

# To delete from the bucket any files that no longer exist locally (clean deploy)
aws s3 sync ./ s3://<my bucket name> --delete

# Using the api:

aws s3api put-object --bucket <your bucket name> --key index.html --body ./index.html

# bucket: the name of the S3 bucket where the object will be stored.
# key: the name and path of the file inside the bucket.
# body: the local path to the file you want to upload.
# You cannot upload multiple files at once using the API.
```

### Step 3 – Enable Static Website Hosting

Use `put-bucket-website`

```bash
aws s3api put-bucket-website --bucket <your bucket name> --website-configuration \
'{"IndexDocument": {"Suffix": "index.html"}, "ErrorDocument": {"Key": "error.html"}}'
```
**IndexDocument** → default landing page (usually index.html).

**ErrorDocument** → page for errors (e.g., error.html).

### Step 4 – Make the bucket publicly readable (Bucket Policy)

Set public read permissions (To make it publicly accessible)

```bash
aws s3api put-bucket-policy \
--bucket <your bucket name> \  
--policy '{
"Version:" "2012-10-17"
"Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": ["s3:GetObject"],
      "Resource": ["arn:aws:s3:::<your bucket name>/*"]
    }
  ]
}'
```

### Step 5 – Test your website!

```bash
# ---------------------------------------------
# Check the static website configuration for your S3 bucket
# This command shows the index and error documents and confirms that
# static website hosting is enabled.
# ---------------------------------------------

aws s3api get-bucket-website --bucket <your-bucket-name>

# ---------------------------------------------
# Example output:
# You’ll see the website configuration, including IndexDocument and ErrorDocument.
# Your public website URL will usually look like this:
# http://my-awesome-website-2025.s3-website-us-east-1.amazonaws.com
# ---------------------------------------------
```

### Step 6 – Delete your bucket!

To delete your bucket, use:

```bash
# ---------------------------------------------
# Deleting a single file from your bucket
# ---------------------------------------------
aws s3 rm s3://<your-bucket-name>/index.html

# ---------------------------------------------
# Deleting all files in a bucket recursively
# ---------------------------------------------
aws s3 rm s3://<your-bucket-name>/ --recursive

# ---------------------------------------------
# Deleting a single object using the S3 API
# ---------------------------------------------
aws s3api delete-object --bucket <your-bucket-name> --key index.html

# ---------------------------------------------
# Deleting an empty bucket
# ---------------------------------------------
aws s3 rb s3://<your-bucket-name>

# ---------------------------------------------
# Force-delete a bucket and all its contents
# (no need to empty it manually)
# ---------------------------------------------
aws s3 rb s3://<your-bucket-name> --force
```
