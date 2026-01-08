---
title: "Hands-On Lab #2: Amazon S3 Bucket Versioning, Object Recovery & MFA Delete Protection"
duration: "25 minutes"
level: "Beginner → Intermediate"
date: 2025-11-26
category: S3, Data Protection, Governance
author: "Alberto Martinez"
---

# Lab #2: S3 Bucket Versioning – Protect and Recover Your Data Like a Pro

In this lab you will learn how to:

- Enable **Versioning** on an S3 bucket

- See version **history** in action

- Accidentally **delete** or **overwrite** file and **recover** them instantly

- Protect your data with **MFA Delete**

This is one of the most common real-world requirements in enterprises and a favorite interview question!

**Cost**: 100% Free Tier

## Prerequisites
- An AWS account with console access
- Basic familiarity with S3 (Lab #1 recommended but not required)

## Lab Files – Download Here
[Download ZIP](https://github.com/AGMTZG/aws-labs-collection/tree/master/bucket-versioning/assets)

Files included:

```bash
bucket-versioning/
├── photo-v1.jpg     (a cute cat)
├── photo-v2.jpg     (same cat with glasses)
└── sample.pdf
```

## Lab Steps

### Step 1 – Create a new bucket and enable Versioning from the start

- Go to S3 Console → **Create bucket**

- **Bucket name**: `s3-versioning-demo-yourname-2025` (must be unique)
Alternatively, you can generate a valid and unique bucket name using: `https://app.vians.org/s3-bucket-name-generator/`

- **Region**: `us-east-1` (recommended)

- **Leave "Block all public access" checked** (we don’t need public access)

- Scroll down → **Bucket Versioning** → Select **Enable**

- Create bucket

### Step 2 – Upload the first version of files

- Open your new bucket

- Upload `photo-v1.jpg` and `sample.pdf`

- After upload, click the dropdown next to each file → **Versions** → You’ll see Version ID created

### Step 3 – Overwrite and delete files (on purpose!)

Do the following actions one by one:

| Action                                                      | What happens internally                            |
|-------------------------------------------------------------|----------------------------------------------------|
| Upload `photo-v2.jpg` with the **same key** as photo-v1.jpg | Creates a new version (v1 still exists!)           |
| Delete `sample.pdf`                                         | File gets a **Delete Marker** (not really deleted) |
| Delete `photo-v2.jpg`                                       | Another Delete Marker is added                     |

Your bucket will look “empty” in the console… but nothing is actually lost!

### Step 4 – Recover everything in seconds

- Click **Show versions** (top-right button)

- Now you see ALL versions and delete markers!

- To recover:

   - Select the latest non-deleted version of `sample.pdf` → **Download** or **Restore**

   - To permanently bring back a file: select the version → **Actions** → **Delete** → choose “Delete this delete marker”

- Hide versions again → files are back like magic!

### Step 5 – (Advanced) Enable MFA Delete – The Nuclear Protection

This prevents anyone (even you or a root user) from permanently deleting objects without an MFA code.

- Go to bucket → **Properties** → **Bucket Versioning** → **Edit**

- Change **MFA Delete** to **Enable**

- Save changes → You’ll be asked for your MFA code the first time

- Try to permanently delete any version now → You’ll be blocked without MFA!

**Important**: 

Only account root user + MFA can now:
- Permanently delete object versions
- Change bucket versioning settings
- Disable MFA Delete

### Step 6 – Clean up

1. Delete all object versions and delete markers (you’ll need MFA!)
2. Delete the bucket

## What You Learned (Summary)

| Feature               | What it protects against                         | Real-world use case                          |
|-----------------------|--------------------------------------------------|----------------------------------------------|
| Versioning            | Accidental overwrites & deletes                  | Ransomware, human error, bad deployments     |
| Version history       | Instant recovery without backups                 | Rollback in seconds                          |
| MFA Delete            | Rogue admins or compromised credentials          | Compliance (PCI, HIPAA, etc.) & extra safety |

### Dont`t forget to delete your bucket

- Go to the buckets main page.

- **Locate your bucket** in the list.

- Empty the bucket (delete all objects and folders):

  - Go to the **Objects** tab.

  - Select all objects → Click **Delete** → Confirm.

- Go back to the **Buckets** list.

- Select the bucket → Click **Delete bucket**.

- Type the bucket name to confirm → Click **Confirm**.

```bash
aws s3 rb s3://<your-bucket-name> --force
```

You're done!

You solved this challenge!
