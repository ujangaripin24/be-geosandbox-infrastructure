# API Collection & Global Endpoint (Swagger UI)

Folder ini berisi konfigurasi **Swagger UI (Interactive API Documentation)** yang berjalan di dalam Docker Container. 

Dengan alat ini, tim dapat mengakses dokumentasi API secara global via browser, serta mencoba (*Try it out*) request HTTP secara langsung seperti halnya menggunakan Postman.

---

## 📁 Struktur File

- [`swagger.yaml`](./swagger.yaml): Spesifikasi OpenAPI 3.0 (Kategori: Auth Service, GIS Service, User Service).
- [`docker-compose.yml`](./docker-compose.yml): Spesifikasi container Swagger UI.

---

## 🚀 Cara Menjalankan

1. Buka terminal dan masuk ke folder `collection-endpoint`:
   ```bash
   cd collection-endpoint
   ```

2. Jalankan container:
   ```bash
   docker compose up -d
   ```

3. Akses Swagger UI di browser:
   - **URL**: [http://localhost:8080](http://localhost:8080)

---

## 🧪 Fitur & Cara Penggunaan

1. **Memilih Target Host (Server)**:
   - `http://localhost:8000` (Kong API Gateway Proxy)
   - `http://localhost:3610` (Auth Service Direct)
   - `http://localhost:3620` (GIS Service Direct)
   - `http://localhost:3630` (User Service Direct)

2. **Autentikasi JWT (Authorize)**:
   - Klik tombol **Authorize** (ikon gembok) di kanan atas.
   - Masukkan token JWT pada kolom `Value` (format: `<token_tanpa_Bearer>`).
   - Klik **Authorize** -> **Close**.

3. **Menguji Endpoint ("Try it out")**:
   - Pilih endpoint (misal: `POST /api/v1/auth/login`).
   - Klik tombol **Try it out**.
   - Isi request body dan klik **Execute**.
