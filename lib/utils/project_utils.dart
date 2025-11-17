class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;
  final List<String> screenshots;
  final double? galleryAspectRatio;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.androidLink,
    this.iosLink,
    this.webLink,
    this.screenshots = const [],
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
    image: _playStoreScreenshots[0],
    title: 'HealthShop',
    subtitle:
        'HealthShop, yiyecek ürünlerinin barkodlarını tarayarak içerik bilgilerini görüntülemenize, ürünleri düzenlemenize ve alışveriş listelerinizi oluşturmanıza yardımcı olan pratik bir uygulamadır. Açık veri kaynaklarından alınan bilgilerle ürün içeriklerini öğrenebilir, kendi tercihleriniz doğrultusunda daha bilinçli seçimler yapabilirsiniz.',
    androidLink:
        'https://play.google.com/store/apps/details?id=com.cngz.arya&pcampaignid=web_share',
    screenshots: _screens(0, length: 8),
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
  ),


];

