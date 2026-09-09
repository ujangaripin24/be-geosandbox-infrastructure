Berikut adalah ringkasan langkah-langkah penyiapan infrastruktur server (*self-hosted VM/EC2*) dan konfigurasi jaringan/firewall untuk panduanmu di masa depan:

* **Hubungkan DNS Subdomain ke IP VM**
Masuk ke pengelola domain (seperti Cloudflare atau registrar tempat domain dibeli), lalu buat **A Record** untuk setiap subdomain (misalnya `api`, `rabbitmq`, `docs`, `grafana`, `prometheus`) yang mengarah langsung ke IP Public VM/servermu.


* **Install dan Konfigurasi Nginx (Reverse Proxy)**
* Install Nginx di server menggunakan perintah `sudo apt update && sudo apt install nginx -y`.
* Pastikan Nginx berjalan dan aktif saat server dinyalakan via `sudo systemctl start nginx` dan `sudo systemctl enable nginx`.
* Nginx nantinya akan membaca file konfigurasi dari CI/CD untuk memetakan trafik dari port 80/443 ke masing-masing port internal Docker.




* **Buka Port dan Aktifkan Firewall (UFW)**
* Izinkan akses SSH agar tidak terputus: `sudo ufw allow ssh` atau `sudo ufw allow 22/tcp`.
* Buka port HTTP dan HTTPS untuk Nginx: `sudo ufw allow 80/tcp` dan `sudo ufw allow 443/tcp`.
* Aktifkan firewall sistem: `sudo ufw enable` (ketik `y` saat konfirmasi).
* Muat ulang firewall: `sudo ufw reload`.


* **Siapkan GitHub Actions Self-Hosted Runner**
* Pasang dan aktifkan *runner* GitHub di dalam server VM agar terhubung ke repository GitHub-mu.


* **Eksekusi Deployment (CI/CD)**
* Pastikan file `ci-cd.yml` sudah tersedia di repository.


* Lakukan `git push` ke branch `development`. GitHub Actions akan otomatis memvalidasi file *compose*, membuat jaringan Docker bersama (`global-network-geosandbox`), menyalakan seluruh kontainer infrastruktur, memperbarui konfigurasi Nginx, dan menjalankan *health checks*.