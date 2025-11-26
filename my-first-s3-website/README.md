---
title: "Hands-On Lab: Host a Static Website on Amazon S3"
duration: "20 minutes"
level: "Beginner"
date: 2025-11-26
category: S3, Static Website Hosting
author: "Alberto Martinez"
---

# Hands-On Lab: Host Your First Static Website on Amazon S3

In less than 20 minutes you’ll have a fully functional website live on the internet — using only Amazon S3!

**Final result** → A public URL like:  
`http://my-awesome-website-2025.s3-website.us-east-1.amazonaws.com`

**Cost**: 100% Free Tier eligible

## Lab Files (Download everything here)

[Download ZIP with all files](https://github.com/AGMTZG/aws-labs-collection/tree/master/my-first-s3-website/assets)

### Folder structure

```bash
my-first-s3-website/
├── index.html
├── styles.css
└── script.js
```

## Lab Steps

### Step 1 – Create the S3 bucket

- Go to the **S3** console → `https://s3.console.aws.amazon.com`

- Click **Create bucket**

- **Bucket name**: must be globally unique (for example, `my-awesome-website-2025`).
Alternatively, you can generate a valid and unique bucket name using: `https://app.vians.org/s3-bucket-name-generator/`

- **Region** → choose the closest (recommended: `us-east-1`)

- Uncheck **Block all public access**


- Acknowledge the warning and create the bucket

### Step 2 – Upload the files

- Open your new bucket

- Click **Upload**

- Drag and drop the three files (or the entire folder)

- Click **Upload**

### Step 3 – Enable Static Website Hosting

- Go to the **Properties** tab

- Scroll down to **Static website hosting** → **Edit**

- Choose **Enable**

- Index document: `index.html`

- Error document (optional): `error.html`

- **Save changes**

- Copy the website endpoint URL shown!

### Step 4 – Make the bucket publicly readable (Bucket Policy)

- Go to **Permissions** → **Bucket policy** → **Edit**

- Paste this policy (replace `my-awesome-website-2025` with your bucket name):

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::my-awesome-website-2025/*"
        }
    ]
}
```

### Step 5 – Test your website!

Open the S3 website endpoint in an incognito window.
You should see your beautiful page with styles, button, and working JavaScript!

### Step 6 – Delete your bucket!

You need to delete your S3 bucket when you’re done with it because **AWS charges for storage**, even if it’s just a few files. Removing the bucket ensures you don’t incur any unwanted costs.

- Go to the buckets main page.

- **Locate your bucket** in the list.

- Empty the bucket (delete all objects and folders):

  - Go to the **Objects** tab.

  - Select all objects → Click **Delete** → Confirm.

- Go back to the **Buckets** list.

- Select the bucket → Click **Delete bucket**.

- Type the bucket name to confirm → Click **Confirm**.

After this, your bucket and all its contents will be permanently deleted, and you won’t be charged for it anymore.

You're done!

You completed this lab!
