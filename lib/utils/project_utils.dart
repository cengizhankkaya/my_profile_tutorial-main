class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;
  final List<String> screenshots;
  final List<String> techStack;
  final double? galleryAspectRatio;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.androidLink,
    this.iosLink,
    this.webLink,
    this.screenshots = const [],
    this.techStack = const [],
    this.galleryAspectRatio,
  });
}

const List<String> _playStoreScreenshots = [
  'assets/groceryshopping/logo.png',
  'assets/groceryshopping/1.png',
  'assets/groceryshopping/2.png',
  'assets/groceryshopping/3.png',
  'assets/groceryshopping/4.png',
  'assets/groceryshopping/5.png',
  'assets/groceryshopping/6.png',
  'assets/groceryshopping/7.png',
  'assets/groceryshopping/8.png',
];

const List<String> _abc123Screenshots = [
  'assets/abc123/logo.png',
  'assets/abc123/unnamed.png',
  'assets/abc123/unnamed-1.png',
  'assets/abc123/unnamed-4.png',
  'assets/abc123/unnamed-5.png',
  'assets/abc123/unnamed-6.png',
  'assets/abc123/unnamed-7.png',
  'assets/abc123/unnamed-8.png',
  'assets/abc123/unnamed-9.png',
];

const List<String> _fweatherScreenshots = [
  'assets/fweather/unnamed.png',
  'assets/fweather/unnamed-1.png',
  'assets/fweather/unnamed-4.png',
  'assets/fweather/unnamed-5.png',
  'assets/fweather/unnamed-6.png',
  'assets/fweather/unnamed-7.png',
];

const List<String> _emotiTrScreenshots = [
  'assets/EmotiTR/logo.jpg',
  'assets/EmotiTR/1.png',
  'assets/EmotiTR/2.png',
  'assets/EmotiTR/3.png',
  'assets/EmotiTR/4.png',
  'assets/EmotiTR/5.png',
  'assets/EmotiTR/6.png',
];

List<String> _screens(int startIndex, {int length = 3}) {
  return List.generate(length, (offset) {
    final index = (startIndex + offset) % _playStoreScreenshots.length;
    return _playStoreScreenshots[index];
  });
}

List<ProjectUtils> workProjectUtils = [];

// ###############
// HOBBY PROJECTS
List<ProjectUtils> hobbyProjectUtils = [
  ProjectUtils(
    image: 'assets/EmotiTR/logo.jpg',
    title: 'Emoti',
    subtitle:
        'Emoti, arkadaşlarınızla görüntülü görüşebileceğiniz ve aynı anda videoları senkronize olarak izleyebileceğiniz (Birlikte İzle) modern bir iletişim platformudur. Uçtan uca şifreleme ve Google Sign-In ile güvenli iletişim sunar.',
    screenshots: _emotiTrScreenshots,
    techStack: const [
      'Flutter',
      'Dart',
      'BLoC',
      'Firebase (Auth, Firestore)',
      'WebRTC (Video Call)',
      'Google Sign-In',
      'Google Drive API',
      'Clean Architecture',
    ],
  ),
  ProjectUtils(
    image: 'assets/AnimeAppStoreMağzaTR/logo.jpg',
    title: 'AI AnimeCreator',
    subtitle:
        'AI Anime Creator, anime esintili kısa hikâyeleri yapay zekâ ile anında oluşturmanı sağlar. Fikirlerini metne dök, hikâyenin yapay zekâ tarafından devam ettirilmesine izin ver, oluşturduklarını kaydet, favorilerine ekle ve istediğin zaman tekrar geri dön.',
    androidLink:
        'https://play.google.com/store/apps/details?id=com.cengizhan.animeai',
    screenshots: [
      'assets/AnimeAppStoreMağzaTR/1.png',
      'assets/AnimeAppStoreMağzaTR/2.png',
      'assets/AnimeAppStoreMağzaTR/3.png',
      'assets/AnimeAppStoreMağzaTR/4.png',
      'assets/AnimeAppStoreMağzaTR/5.png',
      'assets/AnimeAppStoreMağzaTR/6.png',
      'assets/AnimeAppStoreMağzaTR/7.png',
    ],
    techStack: const [
      'Flutter',
      'Dart',
      'Firebase (Auth, Firestore, Functions, AI)',
      'Node.js (Cloud Functions)',
      'Flutter Bloc (Cubit)',
      'Auto Route',
      'GetIt (DI)',
      'Equatable',
      'Material Design',
      'Rive (Animation)',
      'Lottie',
      'Easy Localization',
      'In-App Purchase',
      'Share Plus',
      'Flutter TTS',
      'Google Fonts',
      'Flutter SVG',
    ],
  ),
  ProjectUtils(
    image: _playStoreScreenshots[0],
    title: 'HealthShop',
    subtitle:
        'HealthShop, yiyecek ürünlerinin barkodlarını tarayarak içerik bilgilerini görüntülemenize, ürünleri düzenlemenize ve alışveriş listelerinizi oluşturmanıza yardımcı olan pratik bir uygulamadır. Açık veri kaynaklarından alınan bilgilerle ürün içeriklerini öğrenebilir, kendi tercihleriniz doğrultusunda daha bilinçli seçimler yapabilirsiniz.',
    androidLink:
        'https://play.google.com/store/apps/details?id=com.cngz.arya&pcampaignid=web_share',
    screenshots: _screens(0, length: 8),
    techStack: const [
      'Flutter',
      'Provider',
      'Firebase (auth/firestore/core)',
      'REST (dio)',
      'Auto Route',
      'Easy Localization',
      'Mobile Scanner (barcode/qrcode)',
      'Image Picker (gallery/camera)',
      'Lottie',
      'Shimmer',
      'Shared Preferences',
      'MVVM Architecture',
      'Clean Code',
      'Clean Arch.',
      'SOLID Principles',
      'Dependency Injection',
      'Unit Tests',
      'Integration Tests',
      'UI Tests',
      'Performance Optimization',
    ],
  ),
  ProjectUtils(
      image: 'assets/abc123/logo.png',
      title: 'Abc123',
      subtitle:
          'Abc123, çocukların hem eğlenmelerini hem de öğrenmelerini sağlayan bir çizim uygulamasıdır. Bu uygulama, çocukların yaratıcılıklarını ve sanatsal yeteneklerini geliştirmelerine yardımcı olur. Çocuklarınızın eğlenirken öğrenmelerini sağlayın ve onların yaratıcılığını serbest bırakın!',
      androidLink:
          'https://play.google.com/store/apps/details?id=com.cengizhan.abc123',
      screenshots: _abc123Screenshots,
      galleryAspectRatio: 16 / 9,
      techStack: const [
        'Flutter',
        'Provider (State Management)',
        'TensorFlow Lite (ML Models)',
        'Google Mobile Ads',
        'Shared Preferences',
        'Image Picker (gallery/camera)',
        'Audio Players',
        'Google Fonts',
        'Flutter SVG',
        'Path Provider',
        'Image Processing (image package)',
        'Signature/Scribble (Drawing)',
        'URL Launcher',
        'Feature-based Architecture',
        'Singleton Pattern',
        'Responsive Design (Screen Util)',
        'Custom Localization System',
        'Material Design',
        'Canvas API (Drawing)',
        'Image Rendering & Processing',
        'ML Model Inference',
      ]),
  ProjectUtils(
    image: 'assets/fweather/logo.png',
    title: 'FWeather',
    androidLink:
        'https://play.google.com/store/apps/details?id=com.kaya.fweather&pcampaignid=web_share',
    subtitle:
        'FWeather, anlık konum bilgisiyle çalışarak size sade bir arayüz üzerinden güncel hava durumu, kısa vadeli tahminler ve sıcaklık uyarıları sunar. Outdoor planlamalarınızı kolaylaştırmak için tasarlanan uygulama aynı zamanda favori şehirlerinizi kaydetmenize de olanak tanır.',
    screenshots: _fweatherScreenshots,
    galleryAspectRatio: 9 / 16,
    techStack: const [
      'Flutter',
      'Riverpod',
      'Weather API',
      'Clean Arch.',
    ],
  ),
];
