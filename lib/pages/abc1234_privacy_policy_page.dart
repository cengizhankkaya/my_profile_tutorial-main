import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/support_email.dart';
import 'package:my_portfolio/constants/privacy_policy_lang.dart';
import 'package:my_portfolio/widgets/privacy_language_selector.dart';

class Abc1234PrivacyPolicyPage extends StatefulWidget {
  const Abc1234PrivacyPolicyPage({super.key});

  @override
  State<Abc1234PrivacyPolicyPage> createState() => _Abc1234PrivacyPolicyPageState();
}

class _Abc1234PrivacyPolicyPageState extends State<Abc1234PrivacyPolicyPage> {
  PrivacyPolicyLang _lang = PrivacyPolicyLang.tr;

  @override
  Widget build(BuildContext context) {
    final t = _Abc1234Copy(_lang);

    return Scaffold(
      backgroundColor: CustomColor.scaffoldBg,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(t.appBarTitle),
        backgroundColor: CustomColor.bgLight1,
        elevation: 0,
        centerTitle: true,
        actions: [
          PrivacyLanguageSelector(
            value: _lang,
            onChanged: (v) => setState(() => _lang = v),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/abc123/logo.png',
                  height: 88,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.privacy_tip_outlined,
                    size: 80,
                    color: CustomColor.bluePrimary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              t.appName,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: CustomColor.whitePrimary,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: CustomColor.bgLight1,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: CustomColor.bgLight2),
              ),
              child: Column(
                children: [
                  Text(
                    t.lastUpdated,
                    style: const TextStyle(
                      fontSize: 14,
                      color: CustomColor.hintDark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    t.intro,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 16,
                      color: CustomColor.whiteSecondary,
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
              icon: Icons.link,
              content: t.s3Content,
            ),
            _PrivacySection(
              title: t.s4Title,
              icon: Icons.security,
              content: t.s4Content,
            ),
            _PrivacySection(
              title: t.s5Title,
              icon: Icons.child_care,
              content: t.s5Content,
            ),
            _PrivacySection(
              title: t.s6Title,
              icon: Icons.update,
              content: t.s6Content,
            ),
            _PrivacySection(
              title: t.s7Title,
              icon: Icons.delete_forever,
              content: t.s7Content,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: CustomColor.bgLight1.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: CustomColor.blueSecondary.withValues(alpha: 0.3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.contact_mail,
                          color: CustomColor.bluePrimary),
                      const SizedBox(width: 10),
                      Text(
                        t.s8Title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.whitePrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    t.contactIntro,
                    style: const TextStyle(
                      fontSize: 14,
                      color: CustomColor.whiteSecondary,
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

class _Abc1234Copy {
  _Abc1234Copy(this.l);
  final PrivacyPolicyLang l;
  bool get en => l == PrivacyPolicyLang.en;

  String get appBarTitle =>
      en ? 'PRIVACY POLICY' : 'GİZLİLİK POLİTİKASI';

  String get appName => 'Abc1234';

  String get lastUpdated => en
      ? 'Last updated: April 15, 2026'
      : 'Son Güncelleme: 15 Nisan 2026';

  String get intro => en
      ? 'Abc1234 ("App") values your privacy. This Privacy Policy explains how your personal data is processed when you use the drawing and learning experience.'
      : 'Abc1234 ("Uygulama") olarak gizliliğinize önem veriyoruz. Bu Gizlilik Politikası, çizim ve öğrenme deneyimini kullanırken kişisel verilerinizin nasıl işlendiğini açıklar.';

  String get s1Title =>
      en ? '1. INFORMATION WE COLLECT' : '1. TOPLANAN BİLGİLER';

  String get s1Content => en
      ? 'When you use the app, the following types of data may be processed:\n\n'
          'a) Non-personal / technical data:\n'
          '• Device model and operating system version\n'
          '• App crash and error reports\n'
          '• Usage and performance statistics (in a form that does not directly identify you)\n\n'
          'b) Advertising identifier:\n'
          'For ads shown through Google Mobile Ads (AdMob), Google and partners may process identifiers such as your device advertising ID.\n\n'
          'c) Gallery and camera (only if you grant permission):\n'
          'Drawing or content flows may request gallery or camera access to use images you choose. Such data is used only for actions you initiate.\n\n'
          'd) On-device storage:\n'
          'Preferences and content you create (e.g. drawings) may be kept on your device (e.g. local storage) where possible.\n\n'
          'e) Machine learning models (TensorFlow Lite):\n'
          'In-app ML inference runs on your device where possible; images are not sent to our servers for model inference.'
      : 'Uygulamayı kullanırken aşağıdaki türde veriler işlenebilir:\n\n'
          'a) Kişisel olmayan / teknik veriler:\n'
          '• Cihaz modeli ve işletim sistemi sürümü\n'
          '• Uygulama çökme ve hata raporları\n'
          '• Kullanım ve performansa ilişkin istatistikler (kimliğinizi doğrudan ortaya çıkarmayan biçimde)\n\n'
          'b) Reklam kimliği (Advertising ID):\n'
          'Google Mobile Ads (AdMob) ile gösterilen reklamlar için Google ve iş ortakları, cihazınızdaki reklam kimliği gibi tanımlayıcıları işleyebilir.\n\n'
          'c) Galeri ve kamera (yalnızca siz izin verirseniz):\n'
          'Çizim veya içerik oluşturma akışlarında, seçtiğiniz görselleri kullanmak için galeri veya kamera erişimi istenebilir. Bu veriler yalnızca sizin başlattığınız işlemler için kullanılır.\n\n'
          'd) Cihaz üzerinde saklama:\n'
          'Tercihler ve oluşturduğunuz çizimler gibi içerikler, mümkün olduğunca cihazınızda (ör. yerel depolama) tutulabilir.\n\n'
          'e) Yapay zekâ modelleri (TensorFlow Lite):\n'
          'Uygulama içi makine öğrenmesi çıkarımları mümkün olduğunca cihazınızda çalıştırılır; model çıkarımı için görüntüler sunucularımıza gönderilmez.';

  String get s2Title =>
      en ? '2. USE OF INFORMATION' : '2. BİLGİLERİN KULLANIMI';

  String get s2Content => en
      ? 'We use collected data to:\n'
          '• Provide drawing, play, and learning features\n'
          '• Improve app stability and performance\n'
          '• Show relevant ads (within AdMob policies)\n'
          '• Provide user support'
      : 'Toplanan verileri şu amaçlarla kullanırız:\n'
          '• Çizim, eğlence ve öğrenme özelliklerini sunmak\n'
          '• Uygulama kararlılığını ve performansını iyileştirmek\n'
          '• Size uygun reklam içeriğini göstermek (AdMob politikaları çerçevesinde)\n'
          '• Kullanıcı desteği sağlamak';

  String get s3Title =>
      en ? '3. THIRD-PARTY SERVICES' : '3. ÜÇÜNCÜ TARAF HİZMETLER';

  String get s3Content => en
      ? 'Parts of our services may run through third-party providers. They have their own privacy policies:\n\n'
          '• Google Mobile Ads (AdMob) and related ad networks\n'
          '• Google Play services (updates, security, etc.)\n\n'
          'We encourage you to read those companies\' policies for details on how they process data.'
      : 'Hizmetlerimizin bir kısmı üçüncü taraf sağlayıcılar üzerinden yürütülebilir. Bunların kendi gizlilik politikaları geçerlidir:\n\n'
          '• Google Mobile Ads (AdMob) ve ilgili reklam ağları\n'
          '• Google Play hizmetleri (güncelleme, güvenlik vb.)\n\n'
          'Bu sağlayıcıların veri işleme uygulamaları için ilgili şirketlerin politikalarını incelemenizi öneririz.';

  String get s4Title => en ? '4. DATA SECURITY' : '4. VERİ GÜVENLİĞİ';

  String get s4Content => en
      ? 'We take reasonable technical and administrative measures to protect your data. Please remember that no transmission or storage on the internet or mobile devices can be absolutely secure.'
      : 'Verilerinizi korumak için makul teknik ve idari önlemler alıyoruz. İnternet ve mobil ortamda hiçbir iletimin veya depolamanın mutlak güvenli olmadığını lütfen unutmayın.';

  String get s5Title =>
      en ? '5. CHILDREN\'S PRIVACY' : '5. ÇOCUKLARIN GİZLİLİĞİ';

  String get s5Content => en
      ? 'Abc1234 offers an experience aimed at children. We do not knowingly ask children under 13 to create accounts or provide unnecessary personal data.\n\n'
          'Parents and guardians: we encourage you to supervise your child\'s use of the app and review device permissions (camera, gallery, notifications) together. If you have concerns, please contact us.'
      : 'Abc1234, çocuklara yönelik bir deneyim sunar. Bilerek 13 yaşın altındaki çocuklardan hesap açmalarını veya gereksiz kişisel veri vermelerini istemeyiz.\n\n'
          'Ebeveyn ve vasiler: Çocuğunuzun uygulamayı kullanımını gözetmenizi ve cihaz izinlerini (kamera, galeri, bildirimler) birlikte değerlendirmenizi öneririz. Çocuğunuzla ilgili endişeniz varsa bizimle iletişime geçebilirsiniz.';

  String get s6Title => en
      ? '6. CHANGES TO THIS POLICY'
      : '6. BU POLİTİKADAKİ DEĞİŞİKLİKLER';

  String get s6Content => en
      ? 'We may update this Privacy Policy from time to time. For material changes, we may notify you in the app or through updated text. Please review the latest version regularly.'
      : 'Bu Gizlilik Politikasını zaman zaman güncelleyebiliriz. Önemli değişikliklerde uygulama içi bildirim veya güncellenmiş metin yoluyla bilgilendirme yapılabilir. Metnin güncel sürümünü düzenli olarak kontrol etmeniz iyi olur.';

  String get s7Title => en
      ? '7. DATA DELETION AND REQUESTS'
      : '7. VERİ SİLME VE TALEPLER';

  String get s7Content => en
      ? 'To clear app data on your device, use your system app settings (e.g. "Clear storage" or "Clear data").\n\n'
          'For requests related to data held by the developer or processed by third parties, contact us at the email address below.'
      : 'Cihazınızdaki uygulama verilerini silmek için işletim sisteminizin uygulama ayarlarından "Depolama temizle" veya "Verileri sil" seçeneklerini kullanabilirsiniz.\n\n'
          'Geliştirici tarafında tutulan veya üçüncü taraflarca işlenen verilerle ilgili talepleriniz için aşağıdaki e-posta adresinden bize ulaşabilirsiniz.';

  String get s8Title => en ? '8. CONTACT' : '8. İLETİŞİM';

  String get contactIntro =>
      en ? 'For privacy-related questions:' : 'Gizlilik ile ilgili sorularınız için:';

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
        color: CustomColor.bgLight1,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
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
              Icon(icon, color: CustomColor.bluePrimary, size: 22),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.whitePrimary,
                  ),
                ),
              ),
            ],
          ),
          const Divider(color: CustomColor.bgLight2, height: 24),
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              color: CustomColor.whiteSecondary,
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
            color: CustomColor.bluePrimary,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              color: CustomColor.whitePrimary,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
