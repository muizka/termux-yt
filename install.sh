#!/data/data/com.termux/files/usr/bin/bash

# Hapus fungsi lama jika ada
sed -i '/yt()/,/}/d' ~/.bashrc
sed -i '/alias yt=/d' ~/.bashrc

# Menambahkan fungsi yt interaktif dengan input manual
cat << 'EOF' >> ~/.bashrc

yt() {
    # Meminta input URL
    read -p "Masukkan link YouTube (Video/Playlist): " url
    
    if [ -z "$url" ]; then
        echo "Error: Link tidak boleh kosong!"
        return
    fi

    # Menampilkan menu manual
    echo "Pilih kualitas download:"
    echo "1) 144p"
    echo "2) 360p"
    echo "3) 720p"
    echo "4) 1080p"
    echo "5) Best"
    
    read -p "Masukkan pilihan (1-5): " pilihan

    case $pilihan in
        1) fmt="bestvideo[height<=144]+bestaudio/best[height<=144]" ;;
        2) fmt="bestvideo[height<=360]+bestaudio/best[height<=360]" ;;
        3) fmt="bestvideo[height<=720]+bestaudio/best[height<=720]" ;;
        4) fmt="bestvideo[height<=1080]+bestaudio/best[height<=1080]" ;;
        5) fmt="bestvideo+bestaudio/best" ;;
        *) echo "Pilihan tidak valid, membatalkan."; return ;;
    esac

    echo "Sedang memproses..."
    mkdir -p /sdcard/YouTube
    yt-dlp --yes-playlist -o "/sdcard/YouTube/%(playlist_title,title)s/%(title)s.%(ext)s" -f "$fmt" --merge-output-format mp4 --progress --progress-template "download:  [DOWNLOAD] %(progress._percent_str)s | Kecepatan: %(progress._speed_str)s | ETA: %(progress._eta_str)s | Ukuran: %(progress._total_bytes_str)s" "$url"
}
EOF

# Refresh bashrc
source ~/.bashrc

echo "========================================="
echo "Instalasi/Update berhasil!"
echo "Ketik 'source ~/.bashrc' lalu coba ketik 'yt' lagi."
echo "========================================="
