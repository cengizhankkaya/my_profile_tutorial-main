import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/privacy_policy_lang.dart';
import 'package:my_portfolio/constants/support_email.dart';
import 'package:my_portfolio/widgets/privacy_language_selector.dart';

class _EmotiColors {
  static const Color backgrounddark = Color(0xFF1A1D21);
  static const Color darkABlue = Color(0xFF1E2229);
  static const Color mutedBlue = Color(0xFF65B5CD);
  static const Color skyBlue = Color(0xFF69A2B8);
  static const Color cream = Color(0xFFDEBCA4);
}

class EmotiPrivacyPolicyPage extends StatefulWidget {
  const EmotiPrivacyPolicyPage({super.key});

  @override
  State<EmotiPrivacyPolicyPage> createState() => _EmotiPrivacyPolicyPageState();
}

class _EmotiPrivacyPolicyPageState extends State<EmotiPrivacyPolicyPage> {
  PrivacyPolicyLang _lang = PrivacyPolicyLang.tr;

  @override
  Widget build(BuildContext context) {
    final t = _EmotiCopy(_lang);

    return Scaffold(
      backgroundColor: _EmotiColors.backgrounddark,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          t.appBarTitle,
          style: const TextStyle(
            color: _EmotiColors.cream,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: _EmotiColors.backgrounddark,
        elevation: 0,
        centerTitle: true,
        actions: [
          PrivacyLanguageSelector(
            value: _lang,
            onChanged: (v) => setState(() => _lang = v),
            selectedBackgroundColor: _EmotiColors.skyBlue,
            selectedForegroundColor: _EmotiColors.backgrounddark,
            foregroundColor: _EmotiColors.cream,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/politc/emotlog.jpg',
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Emoti',
                    style: TextStyle(
                      color: _EmotiColors.skyBlue,
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: _EmotiColors.darkABlue,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: _EmotiColors.mutedBlue.withValues(alpha: 0.3),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    t.lastUpdated,
                    style: const TextStyle(
                      fontSize: 14,
                      color: _EmotiColors.skyBlue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    t.intro,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 16,
                      color: _EmotiColors.cream,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _PrivacySection(
              title: t.s1Title,
              icon: Icons.data_usage,
              content: t.s1Content,
            ),
            _PrivacySection(
              title: t.s2Title,
              icon: Icons.settings_applications,
              content: t.s2Content,
            ),
            _PrivacySection(
              title: t.s3Title,
              icon: Icons.share,
              content: t.s3Content,
            ),
            _PrivacySection(
              title: t.s4Title,
              icon: Icons.security,
              content: t.s4Content,
            ),
            _PrivacySection(
              title: t.s5Title,
              icon: Icons.delete_forever,
              content: t.s5Content,
            ),
            _PrivacySection(
              title: t.s6Title,
              icon: Icons.update,
              content: t.s6Content,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: _EmotiColors.darkABlue,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: _EmotiColors.skyBlue.withValues(alpha: 0.3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.contact_mail,
                          color: _EmotiColors.skyBlue),
                      const SizedBox(width: 10),
                      Text(
                        t.s7ContactTitle,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: _EmotiColors.cream,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    t.contactIntro,
                    style: const TextStyle(
                      fontSize: 14,
                      color: _EmotiColors.cream,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _ContactRow(label: t.labelEmail, value: kSupportEmail),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _EmotiCopy {
  _EmotiCopy(this.l);
  final PrivacyPolicyLang l;
  bool get en => l == PrivacyPolicyLang.en;

  String get appBarTitle =>
      en ? 'PRIVACY POLICY' : 'GİZLİLİK POLİTİKASI';

  String get lastUpdated => en
      ? 'Last updated: February 1, 2026'
      : 'Son Güncelleme: 1 Şubat 2026';

  String get intro => en
      ? 'Emoti ("we", "us", or "App") values your privacy. This Privacy Policy explains how your information is collected, used, and protected when you use our application.'
      : 'Emoti ("biz", "bizim" veya "Uygulama") olarak gizliliğinize önem veriyoruz. Bu Gizlilik Politikası, uygulamamızı kullandığınızda bilgilerinizin nasıl toplandığını, kullanıldığını ve korunduğunu açıklar.';

  String get s1Title =>
      en ? '1. INFORMATION WE COLLECT' : '1. TOPLANAN BİLGİLER';

  String get s1Content => en
      ? 'When you use the app, we may collect and process the following:\n\n'
          '1.1. Personal information\n'
          '• Google account data: When you sign in with Google Sign-In, we receive your name, surname, email address, and profile photo from your Google profile.\n'
          '• User ID: A unique identifier (Firebase UID) is created to recognize you in our systems.\n\n'
          '1.2. User-generated content and media\n'
          '• Google Drive access: For the "Watch Together" feature, we request read-only access to video files in your Google Drive. This is used only to play videos you select; we do not delete or modify your files.\n'
          '• Communications data: Video calls and instant messages are routed through our servers to provide the service. Video calls (WebRTC) are end-to-end encrypted and not recorded.\n\n'
          '1.3. Device permissions\n'
          'We may request:\n'
          '• Camera: for video calls\n'
          '• Microphone: for audio and video calls\n'
          '• Notifications: for download status or important updates'
      : 'Uygulamayı kullanırken aşağıdaki bilgileri toplayabilir ve işleyebiliriz:\n\n'
          '1.1. Kişisel Bilgiler\n'
          '• Google Hesap Bilgileri: Uygulamamıza Google ile Giriş Yap (Google Sign-In) özelliği ile giriş yaptığınızda, Google profilinizden Ad, Soyad, E-posta Adresi ve Profil Fotoğrafı bilgilerinizi alırız.\n'
          '• Kullanıcı Kimliği (User ID): Sistemimizde sizi tanımlamak için benzersiz bir kimlik (Firebase UID) oluşturulur.\n\n'
          '1.2. Kullanıcı Tarafından Oluşturulan İçerik ve Medya\n'
          '• Google Drive Erişimi: Uygulamamızdaki "Birlikte İzle" özelliğini kullanabilmeniz için Google Drive hesabınızdaki video dosyalarına salt okunur (read-only) erişim izni isteriz. Bu erişim sadece seçtiğiniz videoları oynatmak için kullanılır; dosyalarınızı silmeyiz veya değiştirmeyiz.\n'
          '• İletişim Verileri: Görüntülü görüşmeleriniz ve anlık mesajlarınız, hizmetin sağlanması amacıyla sunucularımız üzerinden iletilir. Görüntülü görüşmeler (WebRTC) uçtan uca şifrelenir ve kaydedilmez.\n\n'
          '1.3. Cihaz İzinleri\n'
          'Uygulamanın çalışması için aşağıdaki izinleri talep edebiliriz:\n'
          '• Kamera: Görüntülü görüşme yapabilmeniz için.\n'
          '• Mikrofon: Sesli ve görüntülü görüşme yapabilmeniz için.\n'
          '• Bildirimler: İndirme durumları veya önemli güncellemeler hakkında sizi bilgilendirmek için.';

  String get s2Title =>
      en ? '2. USE OF INFORMATION' : '2. BİLGİLERİN KULLANIMI';

  String get s2Content => en
      ? 'We use the information we collect to:\n'
          '• Create user accounts and authenticate you\n'
          '• Provide video calls and watch-together features\n'
          '• Detect bugs and improve performance\n'
          '• Provide customer support'
      : 'Topladığımız bilgileri şu amaçlarla kullanırız:\n'
          '• Kullanıcı hesabı oluşturmak ve kimlik doğrulaması yapmak.\n'
          '• Görüntülü görüşme ve birlikte izleme hizmetlerini sağlamak.\n'
          '• Uygulama hatalarını tespit etmek ve performansı iyileştirmek.\n'
          '• Kullanıcı desteği sağlamak.';

  String get s3Title =>
      en ? '3. SHARING OF INFORMATION' : '3. BİLGİLERİN PAYLAŞILMASI';

  String get s3Content => en
      ? 'We do not sell your personal data to third parties. Information may be shared only in these cases:\n'
          '• Service providers: we use Google Firebase for infrastructure and database services.\n'
          '• Legal requirements: we may disclose information to authorities when required by law.'
      : 'Kişisel verilerinizi üçüncü taraflara satmayız. Bilgileriniz yalnızca aşağıdaki durumlarda paylaşılabilir:\n'
          '• Hizmet Sağlayıcılar: Altyapı ve veri tabanı hizmetleri için Google Firebase kullanmaktayız.\n'
          '• Yasal Zorunluluklar: Kanunen gerekli olduğu durumlarda resmi makamlarla paylaşılabilir.';

  String get s4Title => en ? '4. DATA SECURITY' : '4. VERİ GÜVENLİĞİ';

  String get s4Content => en
      ? 'Your data is transmitted using industry-standard security (HTTPS/TLS) and stored on secure servers. However, no transmission over the internet can be guaranteed to be 100% secure.'
      : 'Verileriniz endüstri standardı güvenlik önlemleri (HTTPS/TLS) ile şifrelenerek iletilir ve güvenli sunucularda saklanır. Ancak, internet üzerinden yapılan hiçbir iletimin %100 güvenli olmadığını unutmayınız.';

  String get s5Title => en
      ? '5. ACCOUNT DELETION AND DATA REQUESTS'
      : '5. HESABIN SİLİNMESİ VE VERİ TALEPLERİ';

  String get s5Content => en
      ? 'You have the right to request deletion of your account and all related data.\n\n'
          'To delete your account, please send an email to the address below with the subject "ACCOUNT DELETION REQUEST".\n\n'
          'After we receive your request and verify your identity, your account and data will be permanently removed from our systems.'
      : 'Kullanıcılar, hesaplarının ve ilişkili tüm verilerin silinmesini talep etme hakkına sahiptir.\n\n'
          'Hesabınızı silmek isterseniz, lütfen aşağıdaki e-posta adresine "HESAP SİLME TALEBİ" konulu bir e-posta gönderin:\n\n'
          'Talebini bize ulaştığında, kimliğinizi doğruladıktan sonra hesabınız ve verileriniz sistemlerimizden kalıcı olarak silinecektir.';

  String get s6Title =>
      en ? '6. CHANGES' : '6. DEĞİŞİKLİKLER';

  String get s6Content => en
      ? 'We may update this privacy policy from time to time. We will notify you in the app when there are material changes.'
      : 'Bu gizlilik politikasını zaman zaman güncelleyebiliriz. Önemli değişiklikler olduğunda uygulama üzerinden sizi bilgilendireceğiz.';

  String get s7ContactTitle => en ? '7. CONTACT' : '7. İLETİŞİM';

  String get contactIntro => en
      ? 'For questions about this privacy policy, you can contact us:'
      : 'Gizlilik politikamızla ilgili sorularınız için bizimle iletişime geçebilirsiniz:';

  String get labelEmail => en ? 'Email' : 'E-posta';
}

class _PrivacySection extends StatelessWidget {
  const _PrivacySection({
    required this.title,
    required this.content,
    required this.icon,
  });

  final String title;
  final String content;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: _EmotiColors.darkABlue,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: _EmotiColors.skyBlue, size: 22),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: _EmotiColors.cream,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: _EmotiColors.mutedBlue.withValues(alpha: 0.2),
            height: 24,
          ),
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              color: _EmotiColors.cream,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ',
          style: const TextStyle(
            color: _EmotiColors.skyBlue,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              color: _EmotiColors.cream,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
