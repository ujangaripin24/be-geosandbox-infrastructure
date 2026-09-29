#!/bin/sh
set -e

if [ ! -f /usr/bin/wget ]; then
  echo "Mengkonfigurasi repository Debian Archive untuk osrm-backend..."
  sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list
  sed -i 's/security.debian.org/archive.debian.org/g' /etc/apt/sources.list
  sed -i '/stretch-updates/d' /etc/apt/sources.list
  apt-get update && apt-get install -y --allow-unauthenticated wget
fi

if [ ! -f /data/sumatra-260927.osrm ]; then
  echo "Mengunduh peta dari storage..."
  wget -O /data/sumatra-260927.osm.pbf http://geosandbox_storage:9000/geo-osm-address-indonesia/sumatra-260927.osm.pbf
  echo "Memproses data OSRM (1/3)..."
  osrm-extract -p /opt/car.lua /data/sumatra-260927.osm.pbf
  echo "Membuat partisi data (2/3)..."
  osrm-partition /data/sumatra-260927.osrm
  echo "Kustomisasi profil data (3/3)..."
  osrm-customize /data/sumatra-260927.osrm
fi

echo "Menjalankan OSRM Routing Server..."
exec osrm-routed --algorithm mld /data/sumatra-260927.osrm
