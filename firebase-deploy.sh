#!/bin/bash

echo "🚀 Firebase Deploy Başlatılıyor..."
echo ""

# 1. Flutter dependencies kontrolü
echo "📦 Flutter dependencies kontrol ediliyor..."
flutter pub get

# 2. Web build oluştur
echo ""
echo "🔨 Web build oluşturuluyor..."
flutter build web --release

# 3. Firebase deploy
echo ""
echo "☁️  Firebase'e deploy ediliyor..."
firebase deploy --only hosting

echo ""
echo "✅ Deploy tamamlandı! 🎉"
echo "🌐 Siteni Firebase Console'dan kontrol edebilirsin."

