# 🎥 Termux-YT

Downloader YouTube untuk Termux menggunakan `yt-dlp` dan `ffmpeg`.

## 📖 Deskripsi

Termux-YT adalah script instalasi sederhana yang memudahkan pengguna Android mengunduh video dan audio dari YouTube melalui Termux. Script ini akan memasang dependensi yang diperlukan dan menyiapkan perintah agar proses download menjadi lebih mudah.

## ✨ Fitur

* Download video YouTube kualitas terbaik
* Download audio dari video YouTube
* Mendukung playlist
* Menggunakan `yt-dlp`
* Mendukung format MP4 dan audio
* Instalasi otomatis melalui satu perintah
* Berjalan langsung di Termux

---

## 📦 Instalasi

Pastikan Termux sudah terpasang dan memiliki akses penyimpanan.

Jalankan perintah berikut:

```bash
curl -L https://raw.githubusercontent.com/muizka/termux-yt/refs/heads/main/install.sh | bash
```

Tunggu hingga proses instalasi selesai.

---

## 🔧 Persyaratan

* Android 7+
* Termux terbaru
* Koneksi internet
* Ruang penyimpanan yang cukup

---

## 🚀 Penggunaan

Setelah instalasi selesai, jalankan perintah yang disediakan oleh script:

```bash
yt
```

Kemudian masukkan URL video YouTube yang ingin diunduh.

Contoh URL:

```text
https://www.youtube.com/watch?v=xxxxxxxxxxx
```

---

## 📁 Lokasi Hasil Download

Secara umum file hasil download akan tersimpan pada:

```text
/storage/emulated/0/Download
```

atau direktori yang telah ditentukan oleh script.

---

## 🔄 Update

Untuk memperbarui yt-dlp:

```bash
pip install -U yt-dlp
```

Atau jalankan ulang installer:

```bash
curl -L https://raw.githubusercontent.com/muizka/termux-yt/refs/heads/main/install.sh | bash
```

---

## 🗑️ Uninstall

Hapus file yang dipasang oleh script:

```bash
rm -f $PREFIX/bin/yt
```

Hapus juga konfigurasi tambahan jika diperlukan.

---

## ⚠️ Catatan

* Gunakan hanya untuk konten yang Anda miliki hak aksesnya.
* Kecepatan unduh bergantung pada koneksi internet.
* Jika YouTube mengubah sistemnya, lakukan update yt-dlp.

---

## 🐞 Troubleshooting

### Permission denied

Jalankan:

```bash
termux-setup-storage
```

### yt-dlp error

Update:

```bash
pip install -U yt-dlp
```

### ffmpeg tidak ditemukan

Install:

```bash
pkg install ffmpeg
```

---

## 🤝 Kontribusi

Kontribusi, issue, dan pull request sangat diterima.

1. Fork repository
2. Buat branch baru
3. Commit perubahan
4. Push ke branch
5. Buat Pull Request

---

## 📜 Lisensi

MIT License

Copyright (c) Muizka

---

## ⭐ Dukungan

Jika project ini bermanfaat, jangan lupa berikan ⭐ pada repository.
