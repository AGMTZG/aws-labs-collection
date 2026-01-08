-- ------------------------------------------------------
-- Database Backup
-- Name: cloudcart_db
-- Date: 2024-02-12
-- Environment: production
-- Notes: After experiments with products and access
-- ------------------------------------------------------

CREATE DATABASE IF NOT EXISTS cloudcart_db;
USE cloudcart_db;

-- ----------------------------
-- Table: users
-- ----------------------------
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(255) NOT NULL UNIQUE,
  name VARCHAR(120) NOT NULL,
  role VARCHAR(50) DEFAULT 'user',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (email, name, role) VALUES
('admin@cloudcart.example', 'Admin User', 'admin'),
('user1@cloudcart.example', 'Test User One', 'user'),
('user2@cloudcart.example', 'Test User Two', 'user'),
('auditor@cloudcart.example', 'Security Auditor', 'read-only');

-- ----------------------------
-- Table: products
-- ----------------------------
CREATE TABLE products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  category VARCHAR(80) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO products (name, category, price, active) VALUES
('S3 Starter Kit', 'storage', 9.00, TRUE),
('IAM Policy Pack', 'security', 12.00, TRUE),
('CloudFront Boost', 'network', 15.00, TRUE),
('Lifecycle Rules Pack', 'storage', 7.00, TRUE),
('Public Access Audit', 'security', 10.00, FALSE);

-- ----------------------------
-- Table: contact_messages
-- ----------------------------
CREATE TABLE contact_messages (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(120),
  email VARCHAR(255),
  message TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO contact_messages (name, email, message) VALUES
('Alice', 'alice@example.com', 'Testing contact form'),
('Bob', 'bob@example.com', 'Does this site support HTTPS?');

-- ----------------------------
-- Table: audit_logs
-- ----------------------------
CREATE TABLE audit_logs (
  id INT AUTO_INCREMENT PRIMARY KEY,
  event_type VARCHAR(80),
  description TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO audit_logs (event_type, description) VALUES
('SECURITY', 'Public access block enabled'),
('CONFIG', 'Bucket policy updated'),
('ERROR', '403 errors detected in access logs');

-- ----------------------------
-- Backup completed successfully
-- ------------------------------------------------------

