---
title: "Hands-On Lab #3: Master Amazon S3 Storage Classes + Lifecycle – Choose Wisely & Save Money"
duration: "35 - 45 minutes"
level: "Beginner → Intermediate"
date: 2026-01-08
category: S3, Storage Classes, Cost Optimization, Lifecycle Policies
author: "Alberto Martinez"
---

# Lab #3: Amazon S3 Storage Classes – How Much Can You Really Save?

In this lab you will:

- Understand real-world differences between the main S3 Storage Classes

- Upload the same file to different classes and compare visible costs

- Create realistic Lifecycle Policies to automatically move data

- See S3 Intelligent-Tiering in action (the "set it and forget it" option)

- Make smart decisions based on common enterprise use cases (very common interview topic!)

Storage Classes covered in this lab:

| Storage Class                                               | Short definition                                   |
|-------------------------------------------------------------|----------------------------------------------------|
| S3 Standard                                                 | Frequent access, highest cost                      |
| S3 Intelligent-Tiering                                      | Automatic tiering, no management needed            |
| S3 Standard-IA                                              | Infrequent but fast access                         |
| S3 Glacier Instant Retrieval                                | Archived data with millisecond retrieval           |
| S3 Glacier Flexible Retrieval                               | Archive storage with minutes to hours retrieval    |
| S3 Glacier Deep Archive                                     | Lowest-cost archive with hours retrieval           |


Estimated cost: Very low (Free Tier covers almost everything with small objects)
Real savings potential: 40–97% depending on access pattern

## Prerequisites

- An AWS account with console access

- Basic familiarity with S3

- AWS CLI installed (optional but recommended)

## Lab Files – Download the entire assets folder
[Download ZIP](https://github.com/AGMTZG/aws-labs-collection/tree/master/amazon-s3-storage-classes/assets)


```bash

assets/
├── website-assets/         # 4 HTML + css + js + one image file
├── logs/                   # 3 log files
├── backups/                # 2 backup .sql files
└── important-docs/         # 4 important mds

```

## Lab Steps

### Step 1 – Create a new bucket (no versioning needed)

- Go to S3 Console → Create bucket

- Bucket name: must be globally unique, you can generate a valid and unique bucket name using: `https://app.vians.org/s3-bucket-name-generator/`

- Region: us-east-1 (cheapest & fastest for most services)

- Block all public access → keep checked (unless you want to test static website later)

- Bucket Versioning → Disable (not needed for this lab)

- Create bucket

### Step 2 - Upload the same files to 6 different Storage Classes

Choose 3 representative files, for example:

- logs/access.log

- website-assets/hero-image.jpg

- backups/backup-2024-01.sql

These files represent:

- Logs (frequently written, rarely read)

- Website assets (frequently read)

- Backups (rarely accessed)

You will upload the same three files 6 times, but each upload must go into a different folder, so objects do not overwrite each other.

Use the following folder structure in your bucket:

```bash

storage-class-test/
├── standard/
├── intelligent-tiering/
├── standard-ia/
├── glacier-instant/
├── glacier-flexible/
└── glacier-deep-archive/

```

### Step 2.1 - Upload process (repeat for each Storage Class)

For each folder, follow the exact same steps, changing only the Storage Class.

1. Open the **Amazon S3 Console**

2. Select your lab bucket

3. Open the folder in your bucket:

```bash

storage-class-test/standard/

```

4. Click **Upload**

5. Click **Add files**

6. Select the following three files:

   - access.log.2025-12

   - hero-image.jpg

   - database-backup-2025.zip

7. Click **Next** until you reach **Properties**

8. In Storage class, select:

   - Standard

9. Leave all other options as default

10. Click **Upload**

### Step 2.2 - Repeat for the remaining Storage Classes

Repeat the same process, changing only the folder and the corresponding **Storage Class**:

| Folder                           | Storage Class to select                |
|----------------------------------|----------------------------------------|
| intelligent-tiering/             | Intelligent-Tiering                    |
| standard-ia/                     | Standard-IA                            |
| glacier-instant/                 | Glacier Instant Retrieval              |
| glacier-flexible/                | Glacier Flexible Retrieval             |
| glacier-deep-archive/            | Glacier Deep Archive                   |


### Step 3 - Observe Intelligent-Tiering in real time

- Upload 4 extra copies of the same log file using S3 Intelligent-Tiering

- Over the next 30–90 minutes:
  - Download one copy every 5–10 minutes (simulate frequent access)
  - Leave the other copies untouched

- Later (you can come back after a few hours or the next day):

- Check **Properties → Storage class** of each copy

- Watch how AWS automatically moves untouched objects to cheaper tiers

- Once you finish, delete that bucket

### Step 4 – Create realistic Lifecycle Policies

Follow these steps to create lifecycle rules in your S3 bucket:

1. Create a new **S3 bucket**, use `https://app.vians.org/s3-bucket-name-generator/`
2. Upload all **assets** folder to the bucket
3. Click on the **Management** tab
4. Click **Create lifecycle rule**

Create **3 separate rules** (each with a different prefix/filter):

### Rule 1 – Website assets (semi-frequent access)

- **Rule name**: (suggested) `Website-assets-semi-frequent`
- **Prefix**: `website-assets/`
- **Transitions**:
  - Transition to **Standard-IA** after **30 days**
  - Transition to **Intelligent-Tiering** after **60 days**  
    *(acts as safety net for unexpected access spikes)*

### Rule 2 – Logs (cold after 1 month)

- **Rule name**: (suggested) `Logs-cold-storage`
- **Prefix**: `logs/`
- **Transitions**:
  - Transition to **Glacier Instant Retrieval** after **45 days**
  - *(Optional)* Transition to **Glacier Flexible Retrieval** after **120 days**

### Rule 3 – Critical backups (almost never accessed)

- **Rule name**: (suggested) `Critical-backups-deep-archive`
- **Prefix**: `backups/`
- **Transitions**:
  - Transition to **Glacier Deep Archive** after **90 days**

### Final Steps

1. Save all rules
2. Wait approximately **5–10 minutes** for the lifecycle configuration to take effect

**Tip**: You can monitor the transition progress in the **Management → Lifecycle rules** section or by checking object storage class in the bucket contents.

### Step 5 – Test retrievals & understand costs

- Try to download an object that has moved to **Glacier Flexible Retrieval** or **Deep Archive**

- Notice the **Restore** request message

- Check estimated restore times and costs (use the AWS Pricing Calculator if you want exact numbers)

### Step 6 – Clean up (very important!)

- Go to **Objects → select everything → Delete**

- Delete all **lifecycle rules**

- Go back to the **Buckets list**

- Select your **bucket → Delete bucket**

- Type the **bucket name to confirm

**Fast CLI cleanup**:

```bash

aws s3 rb s3://<your bucket> --force

```

## Summary – What You Learned

| Storage Class                  | Typical Real-World Use Case                          | Access Latency          |
|--------------------------------|------------------------------------------------------|-------------------------|
| S3 Standard                    | Active websites, apps, daily workloads               | milliseconds            |
| S3 Intelligent-Tiering         | Unknown/variable access patterns                     | milliseconds            |
| S3 Standard-IA                 | Monthly backups, recent logs                         | milliseconds            |
| S3 Glacier Instant Retrieval   | Medical images, media assets (rare access)           | milliseconds            |
| S3 Glacier Flexible Retrieval  | Quarterly/annual backups                             | minutes–hours           |
| S3 Glacier Deep Archive        | Legal compliance, regulatory archives                | 12 hours                |

You're done!

You solved this challenge!
