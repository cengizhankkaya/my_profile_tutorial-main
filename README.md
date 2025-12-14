# Cengizhan Kaya - Kişisel Portföy

Flutter ile geliştirilmiş modern, responsive kişisel portföy web sitesi.

## 🚀 Özellikler

- ✨ Modern ve şık kullanıcı arayüzü
- 📱 Tam responsive tasarım (Mobil, Tablet, Desktop)
- 🎨 Özel animasyonlar ve efektler
- 🌐 Çoklu platform desteği (Web, Android, iOS, Desktop)
- 📊 Proje galerileri ve detaylı bilgiler
- 💼 CV/Özgeçmiş bölümü
- 📧 İletişim formu ve sosyal medya linkleri

## 🛠️ Teknolojiler

- **Flutter** 3.38.1
- **Dart** SDK >=3.0.5 <4.0.0
- **url_launcher** - Harici linkler için
- **Material Design** - UI bileşenleri

## 📦 Kurulum

### Gereksinimler

- Flutter SDK (>=3.0.5)
- Dart SDK
- Git

### Adımlar

1. Projeyi klonlayın:
```bash
git clone https://github.com/cengizhankkaya/my_profile_tutorial-main.git
cd my_profile_tutorial-main
```

2. Bağımlılıkları yükleyin:
```bash
flutter pub get
```

3. Uygulamayı çalıştırın:
```bash
flutter run
```

## 🌐 Web için Build

```bash
flutter build web
```

Build edilen dosyalar `build/web` klasöründe olacaktır.

## 🍎 Safari'de Çalıştırma

### Yöntem 1: Development Modda (Hot Reload ile)

1. Web sunucusu olarak çalıştırın:
```bash
flutter run -d web-server
```

2. Terminal'de görünen URL'i kopyalayın (genellikle `http://localhost:xxxxx`)

3. Safari'yi açın ve URL'i adres çubuğuna yapıştırın

**Not:** Bu yöntemle hot reload özelliği çalışır, kod değişiklikleriniz anında yansır.

### Yöntem 2: Production Build ile

1. Web için build alın:
```bash
flutter build web
```

2. Build edilen dosyaları serve edin. Birkaç seçenek:

**Python ile:**
```bash
cd build/web
python3 -m http.server 8000
```

**Node.js ile (http-server kullanarak):**
```bash
npm install -g http-server
cd build/web
http-server -p 8000
```

**Flutter'ın kendi sunucusu ile:**
```bash
flutter run -d web-server --release
```

3. Safari'de `http://localhost:8000` adresini açın

### Yöntem 3: Doğrudan Safari'de Açma

Flutter, varsayılan tarayıcıyı kullanarak çalıştırabilirsiniz:

```bash
# Safari'yi varsayılan tarayıcı yapın (macOS Ayarlar > Genel > Varsayılan Web Tarayıcısı)
flutter run -d chrome --web-browser-flag="--disable-web-security"
```

Veya doğrudan Safari'yi hedefleyin:
```bash
open -a Safari http://localhost:xxxxx
```

### Safari'de Debugging

Safari'de geliştirici araçlarını açmak için:
1. Safari > Ayarlar > Gelişmiş > "Menü çubuğunda Geliştir menüsünü göster" seçeneğini işaretleyin
2. Geliştir > Web Inspector'ı açın

## 📱 Platform Desteği

- ✅ Web
- ✅ Android
- ✅ iOS
- ✅ Linux
- ✅ macOS
- ✅ Windows

## 📁 Proje Yapısı

```
lib/
├── constants/          # Sabitler (renkler, linkler, listeler)
│   ├── colors.dart
│   ├── nav_items.dart
│   ├── skill_items.dart
│   ├── sns_links.dart
│   └── size.dart
├── pages/             # Sayfalar
│   └── home_page.dart
├── styles/            # Tema ve stiller
│   ├── style.dart
│   └── theme.dart
├── utils/             # Yardımcı sınıflar
│   └── project_utils.dart
└── widgets/           # UI bileşenleri
    ├── animated_widgets.dart
    ├── contact_section.dart
    ├── cv_section.dart
    ├── drawer_mobile.dart
    ├── footer.dart
    ├── header_desktop.dart
    ├── header_mobile.dart
    ├── main_desktop.dart
    ├── main_mobile.dart
    ├── project_card.dart
    ├── projects_section.dart
    ├── site_logo.dart
    ├── skills_desktop.dart
    └── skills_mobile.dart
```

## 🎨 Bölümler

### 1. Ana Sayfa (Hero Section)
- Kişisel tanıtım
- Avatar görseli
- İletişim ve GitHub butonları

### 2. Yetenekler
- Platformlar (Android, Web, iOS, Model Eğitimi)
- Teknolojiler (Flutter, Dart, Swift, Firebase, vb.)

### 3. Projeler
- İş projeleri
- Hobi projeleri
- Her proje için:
  - Ekran görüntüleri galerisi
  - Teknoloji stack bilgisi
  - Store linkleri

### 4. CV/Özgeçmiş
- Eğitim bilgileri
- İş deneyimi
- Sertifikalar ve etkinlikler
- Diller
- Teknik yetenekler

### 5. İletişim
- E-posta adresi
- Sosyal medya linkleri (GitHub, LinkedIn, Medium, Instagram)

## 🎭 Animasyonlar

Proje, özel animasyon widget'ları içerir:

- **FadeInAnimation** - Fade in efekti
- **SlideInAnimation** - Slide in efekti
- **ScaleInAnimation** - Scale animasyonu
- **HoverAnimation** - Hover efekti
- **GlowContainer** - Glow efekti

## 🔧 Yapılandırma

### Sosyal Medya Linklerini Güncelleme

`lib/constants/sns_links.dart` dosyasını düzenleyin:

```dart
class SnsLinks {
  static const String github = "https://github.com/yourusername";
  static const String linkedIn = "https://www.linkedin.com/in/yourprofile";
  // ...
}
```

### Projeleri Güncelleme

`lib/utils/project_utils.dart` dosyasında `workProjectUtils` ve `hobbyProjectUtils` listelerini düzenleyin.

### Renkleri Özelleştirme

`lib/constants/colors.dart` dosyasındaki renk değerlerini değiştirebilirsiniz.

## 🚀 Deployment

### Firebase Hosting

Proje Firebase Hosting için yapılandırılmıştır:

```bash
# Web build
flutter build web

# Firebase deploy
firebase deploy
```

Veya `firebase-deploy.sh` script'ini kullanın.

## 📝 Lisans

Bu proje kişisel kullanım içindir.

## 👤 Yazar

**Cengizhan Kaya**

- GitHub: [@cengizhankkaya](https://github.com/cengizhankkaya)
- LinkedIn: [Cengizhan Kaya](https://www.linkedin.com/in/cengizhankkaya/)
- Medium: [@cengizhankkaya](https://medium.com/@cengizhankkaya)
- Email: cengizhankaya.software@gmail.com

## 🙏 Teşekkürler

Bu portföy sitesi Flutter ile geliştirilmiştir.

---

⭐ Bu projeyi beğendiyseniz yıldız vermeyi unutmayın!
