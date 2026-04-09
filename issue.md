# Product Requirements Document (PRD)
## Personal Web dengan Flutter

**Versi:** 1.0  
**Tanggal:** 09 April 2026  
**Status:** Draft

***

## 1. Overview

### 1.1 Tujuan Produk
Membangun sebuah personal website yang dirender di browser menggunakan **Flutter Web** sebagai framework utama. Website ini berfungsi sebagai portofolio digital sekaligus media presentasi diri secara profesional.

### 1.2 Target Pengguna
- Rekruter / HRD yang ingin mengetahui profil pemilik
- Klien potensial yang mencari jasa freelance
- Sesama developer / kolega yang ingin berkolaborasi

***

## 2. Goals & Non-Goals

### Goals ✅
- Menampilkan informasi pribadi, keahlian, dan portofolio proyek
- Memberikan cara mudah bagi pengunjung untuk menghubungi pemilik
- Tampil responsif di desktop dan mobile browser
- Performa loading cepat dengan Flutter Web (CanvasKit / HTML renderer)

### Non-Goals ❌
- Tidak ada fitur login / autentikasi
- Tidak ada CMS atau back-end dinamis (konten bersifat statis)
- Tidak ada blog atau fitur komentar (dapat ditambahkan di versi berikutnya)

***

## 3. Fitur Utama (MVP)

### 3.1 Navigasi
- Navigation bar fixed di atas dengan link anchor ke setiap section
- Smooth scroll antar section
- Hamburger menu untuk tampilan mobile

### 3.2 Section Hero
- Nama dan tagline (jabatan / profesi)
- Foto profil
- Tombol CTA: "Lihat Portofolio" & "Hubungi Saya"

### 3.3 Section About
- Bio singkat (2–3 paragraf)
- Daftar skill / teknologi yang dikuasai (chip / badge)

### 3.4 Section Experience / Riwayat
- Timeline pengalaman kerja atau pendidikan
- Periode waktu dan deskripsi singkat setiap posisi

### 3.5 Section Portofolio
- Grid card proyek (thumbnail, nama, deskripsi singkat, tech stack)
- Filter berdasarkan kategori (opsional untuk MVP)
- Link ke GitHub / live demo per proyek

### 3.6 Section Kontak
- Form sederhana: Nama, Email, Pesan
- Tombol kirim (integrasi EmailJS atau mailto fallback)
- Link sosial media (GitHub, LinkedIn, Twitter/X)

### 3.7 Footer
- Nama pemilik + tahun
- Link ke sosial media

***

## 4. Spesifikasi Teknis

### 4.1 Framework & Tools

| Komponen | Pilihan |
|---|---|
| Framework | Flutter Web (stable channel) |
| Renderer | Auto (CanvasKit untuk desktop, HTML untuk mobile) |
| State Management | Provider / Riverpod (ringan, cocok untuk skala kecil) |
| Routing | `go_router` (deep-link friendly) |
| Email/Kontak | EmailJS (JavaScript interop) atau `mailto:` |
| Font | Google Fonts via `google_fonts` package |
| Animasi | `flutter_animate` package |
| Hosting | Firebase Hosting / GitHub Pages / Vercel |

### 4.2 Struktur Proyek

```
lib/
├── main.dart
├── core/
│   ├── theme.dart          # Warna, tipografi, spacing
│   └── constants.dart      # Data statis (nama, bio, proyek)
├── widgets/
│   ├── navbar.dart
│   ├── hero_section.dart
│   ├── about_section.dart
│   ├── experience_section.dart
│   ├── portfolio_section.dart
│   ├── contact_section.dart
│   └── footer.dart
└── models/
    ├── project.dart
    └── experience.dart
```

### 4.3 Responsivitas

| Breakpoint | Perangkat | Layout |
|---|---|---|
| < 600px | Mobile | 1 kolom, menu hamburger |
| 600–1024px | Tablet | 2 kolom, nav menyusut |
| > 1024px | Desktop | 3 kolom, full navbar |

Implementasi menggunakan `LayoutBuilder` + `MediaQuery` Flutter.

***

## 5. Desain & UI

### 5.1 Prinsip Desain
- Minimalis dan bersih — konten sebagai fokus utama
- Dark mode sebagai default (opsional light mode toggle)
- Tipografi yang kuat dan mudah dibaca

### 5.2 Palet Warna

| Peran | Light | Dark |
|---|---|---|
| Background | `#F7F6F2` | `#171614` |
| Surface | `#F9F8F5` | `#1C1B19` |
| Teks Utama | `#28251D` | `#CDCCCA` |
| Aksen Primer | `#01696F` | `#4F98A3` |
| Teks Muted | `#7A7974` | `#797876` |

### 5.3 Tipografi
- **Display / Heading:** Playfair Display atau Raleway (serif untuk kesan elegan)
- **Body:** DM Sans atau Inter (bersih, mudah dibaca)
- Ukuran minimal teks: 12sp; body teks: 16sp

***

## 6. Performa & Aksesibilitas

- **Loading awal:** Gunakan loading skeleton saat assets dimuat
- **SEO:** Tambahkan meta tags di `web/index.html` (deskripsi, OG tags)
- **Aksesibilitas:** Semua widget interaktif memiliki `Semantics` label
- **Gambar:** Gunakan `WebP` dan lazy load untuk thumbnail portofolio
- **Lighthouse score target:** Performance ≥ 80, Accessibility ≥ 90

***

## 7. Milestone & Timeline

| Milestone | Deliverable | Estimasi |
|---|---|---|
| M1 | Setup proyek, tema, routing, navbar | 2 hari |
| M2 | Hero + About section | 2 hari |
| M3 | Experience + Portfolio section | 3 hari |
| M4 | Contact section + form integrasi | 2 hari |
| M5 | Responsivitas & animasi | 2 hari |
| M6 | Testing, optimasi, & deployment | 2 hari |
| **Total** | **MVP siap deploy** | **~13 hari** |

***

## 8. Kriteria Selesai (Definition of Done)

- [ ] Semua 6 section tampil dengan benar di Chrome, Firefox, dan Safari
- [ ] Responsif di mobile (375px) dan desktop (1280px+)
- [ ] Form kontak berhasil mengirim pesan
- [ ] Build `flutter build web` berhasil tanpa error
- [ ] Di-deploy dan dapat diakses via URL publik
- [ ] Lighthouse Performance ≥ 80

***

## 9. Risiko & Mitigasi

| Risiko | Dampak | Mitigasi |
|---|---|---|
| Flutter Web loading lambat | UX buruk | Gunakan HTML renderer untuk mobile; tambahkan splash screen |
| SEO terbatas di Flutter Web | Visibilitas rendah | Tambahkan meta tags & sitemap; pertimbangkan pre-rendering |
| Kompatibilitas browser | Tampilan rusak | Test di minimal 3 browser utama sebelum release |

***

*Dokumen ini merupakan versi awal dan dapat diperbarui seiring perkembangan proyek.*