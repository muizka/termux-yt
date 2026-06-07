#!/data/data/com.termux/files/usr/bin/bash

echo "Memperbarui konfigurasi yt-dlp..."

# Update dan Install dependensi
pkg update && pkg upgrade -y
pkg install yt-dlp ffmpeg -y

# Minta akses penyimpanan
termux-setup-storage

# Hapus fungsi lama jika ada
sed -i '/yt()/,/}/d' ~/.bashrc
sed -i '/alias yt=/d' ~/.bashrc

# Menambahkan fungsi yt interaktif dengan pengelompokan folder otomatis
cat << 'EOF' >> ~/.bashrc

yt() {
    # Meminta input URL
    read -p "Masukkan link YouTube (Video atau Playlist): " url
    
    # Validasi input
    if [ -z "$url" ]; then
        echo "Error: Link tidak boleh kosong!"
        return
    fi

    echo "Pilih kualitas download:"
    select kualitas in "144p" "360p" "720p" "1080p" "Best"; do
        case $kualitas in
            "144p") fmt="bestvideo[height<=144]+bestaudio/best[height<=144]"; break;;
            "360p") fmt="bestvideo[height<=360]+bestaudio/best[height<=360]"; break;;
            "720p") fmt="bestvideo[height<=720]+bestaudio/best[height<=720]"; break;;
            "1080p") fmt="bestvideo[height<=1080]+bestaudio/best[height<=1080]"; break;;
            "Best") fmt="bestvideo+bestaudio/best"; break;;
            *) echo "Pilihan tidak valid."; return;;
        esac
    done

    echo "Sedang memproses... (File akan disimpan di folder berdasarkan nama video/playlist)"
    mkdir -p /sdcard/YouTube
    
    # %(playlist_title,title)s membuat folder berdasarkan nama playlist atau nama video
    yt-dlp --yes-playlist -o "/sdcard/YouTube/%(playlist_title,title)s/%(title)s.%(ext)s" -f "$fmt" --merge-output-format mp4 --progress --progress-template "download:  [DOWNLOAD] %(progress._percent_str)s | Kecepatan: %(progress._speed_str)s | ETA: %(progress._eta_str)s | Ukuran: %(progress._total_bytes_str)s" "$url"
}
EOF

# Refresh bashrc
source ~/.bashrc

echo "========================================="
echo "Instalasi selesai!"
echo "Cara pakai:"
echo "1. Ketik 'yt' di terminal"
echo "2. Masukkan link (Video atau Playlist)"
echo "3. Pilih kualitas"
echo "========================================="
