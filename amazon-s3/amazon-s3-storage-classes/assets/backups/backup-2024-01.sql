-- ------------------------------------------------------
-- Database Backup
-- Name: cloudcart_db
-- Date: 2024-01-05
-- Environment: production
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
('user2@cloudcart.example', 'Test User Two', 'user');

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

INSERT INTO products (name, category, price) VALUES
('S3 Starter Kit', 'storage', 9.00),
('IAM Policy Pack', 'security', 12.00),
('CloudFront Boost', 'network', 15.00);

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

-- ----------------------------
-- Backup completed successfully
-- ------------------------------------------------------

