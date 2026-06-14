# Hunian

Hunian adalah aplikasi mobile pencarian properti/hunian (kost, kamar sewa, dll) yang dirancang untuk memudahkan pengguna menemukan tempat tinggal ideal sesuai kebutuhan, khususnya di pasar Indonesia.

## ✨ Fitur Utama

- **Login** — autentikasi pengguna dengan validasi form (email format & password minimal 8 karakter), opsi "Remember me", "Forgot Password", dan login via Google/Facebook
- **Register** — pendaftaran akun baru
- **Home** — pencarian kost/laundry berdasarkan kategori dan lokasi, menampilkan rekomendasi properti dan kota populer
- **Detail & Booking Kost** — melihat detail properti (fasilitas, foto, harga) dan melakukan pemesanan
- **Payment** — proses pembayaran dengan berbagai metode (Virtual Account Bank)
- **Profile, Favorite & History** — kelola data pengguna, simpan favorit, lihat riwayat booking

## 🎨 Desain UI/UX

Desain dibuat menggunakan Figma dengan prinsip konsistensi warna, hierarki visual, dan keterbacaan.

🔗 https://www.figma.com/design/8PPckbIcqXNB9R8rHmaOJA/Hunian-App?node-id=0-1&t=s8FcufXqTXwKCTPu-1

### Color Palette

| Warna            | Hex                   | Penggunaan                                |
| ---------------- | --------------------- | ----------------------------------------- |
| Primary          | `#1D9E75`             | Brand color, button, header, active state |
| Secondary        | `#0F6E56`             | Aksen/dark shade                          |
| White            | `#FEFEFE`             | Background card, teks di atas warna gelap |
| Background Light | `#F2F6FC`             | Background utama aplikasi                 |
| Grey             | `#ABA7A7`             | Border input, divider, ikon non-aktif     |
| Blue / Link      | `#386BFA` & `#7C9CF4` | Link teks (Forgot Password, Sign Up)      |
| Text Primary     | `#3D3B3B`             | Teks utama                                |
| Text Secondary   | `#A2AED0`             | Teks sekunder/placeholder                 |

## 🛠️ Tech Stack

- **Flutter** — framework UI
- **Dart** — programming language
- **Google Fonts** — Poppins

## 🚀 Cara Menjalankan Project

1. Clone repository

```bash
   git clone https://github.com/riganfauzi/hunian_app.git
   cd hunian_app
```

2. Install dependencies

```bash
   flutter pub get
```

3. Jalankan aplikasi

```bash
   flutter run
```
