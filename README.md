# Agribilis E-commerce web application

Welcome to **Agribilis**, a Laravel-based application. This repository includes a fully Dockerized setup to streamline development and deployment.

## 🚀 Features

- Built with Laravel 8.
- Dockerized with PHP-FPM, MySQL, and Nginx for easy containerized development.

---

## Modify Your `/etc/hosts` File

- 127.0.0.1 agribilis.local

---

## Generate a Development SSL Certificate

- ./ssl/generate_cert.sh

---

## Database Access

- DB_HOST=database
- DB_PORT=3306
- DB_DATABASE=agribilis
- DB_USERNAME=root
- DB_PASSWORD=agriblis_password

---

## 🛠️ build the application

- docker-compose up --build -d

---

## Access the Application

https://agribilis.local/