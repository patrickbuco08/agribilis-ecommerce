# Agribilis E-commerce web application

Welcome to **Agribilis**, a Laravel-based application. This repository includes a fully Dockerized setup to streamline development and deployment.

## 🚀 Features

- Built with Laravel 8.
- Dockerized with PHP-FPM, MySQL, and Nginx for easy containerized development.

---

## Modify Your `/etc/hosts` File

```
127.0.0.1 agribilis.local
```

---

## Generate a Development SSL Certificate

```
./ssl/generate_cert.sh
```

---

## Database Access

```
DB_HOST=database
DB_PORT=3306
DB_DATABASE=agribilis
DB_USERNAME=root
DB_PASSWORD=agribilis_password
```

---

## 🛠️ build the application

```
docker-compose up --build -d
```

---

## Run Database Migrations

After building the application, you need to run the database migrations before accessing the application. Run the following command:

```
docker-compose exec app php artisan migrate
```

---

## Access the Application

https://agribilis.local:8000/