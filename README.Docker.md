### Building and running your application

When you're ready, start your application by running:
`docker compose up --build`.

### Deploying your application to the cloud

First, build your image, e.g.: `docker build -t myapp .`.
If your cloud uses a different CPU architecture than your development
machine (e.g., you are on a Mac M1 and your cloud provider is amd64),
you'll want to build the image for that platform, e.g.:
`docker build --platform=linux/amd64 -t myapp .`.

Then, push it to your registry, e.g. `docker push myregistry.com/myapp`.

Consult Docker's [getting started](https://docs.docker.com/go/get-started-sharing/)
docs for more detail on building and pushing.


# Beberapa poin yang biasanya perlu dicek di server Anda:

* siapkan GitHub Actions self-hosted runner terpasang
* siapkan Nginx aktif
* siapkan DNS subdomain pointing ke IP VM
* siapkan port 80/443 dibuka
* siapkan docker dan docker compose terinstall
* siapkan repo infrastruktur ini akan dipakai langsung di

# Setelah Anda selesai riset, saya bisa lanjutkan ke tahap berikut:

* menyesuaikan domain dan subdomain yang benar
* menambahkan SSL/HTTPS dengan certbot
* merapikan workflow agar lebih aman untuk production
* membantu menyiapkan runner self-hosted dan Nginx di Ubuntu 22.04