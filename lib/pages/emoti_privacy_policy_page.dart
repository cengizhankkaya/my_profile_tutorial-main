import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class _EmotiColors {
  static const Color backgrounddark = Color(0xFF1A1D21);
  static const Color darkBlue = Color(0xFF1A1D21);
  static const Color darkABlue = Color(0xFF1E2229);
  static const Color mutedBlue =
      Color(0xFF65B5CD); // Fixed incomplete hex to a likely muted blue
  static const Color skyBlue = Color(0xFF69A2B8);
  static const Color cream = Color(0xFFDEBCA4);
}

class EmotiPrivacyPolicyPage extends StatelessWidget {
  const EmotiPrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _EmotiColors.backgrounddark,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "GİZLİLİK POLİTİKASI",
          style: TextStyle(
            color: _EmotiColors.cream,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: _EmotiColors.backgrounddark,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          children: [
            // Header Icon
            Center(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(20), // Optional rounded corners
                    child: Image.asset(
                      "assets/politc/emotlog.jpg",
                      height: 100, // Reasonable height for a logo
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Emoti',
                    style: GoogleFonts.righteous(
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

            // Intro Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: _EmotiColors.darkABlue,
                borderRadius: BorderRadius.circular(16),
                border:
                    Border.all(color: _EmotiColors.mutedBlue.withOpacity(0.3)),
              ),
              child: Column(
                children: const [
                  Text(
                    "Son Güncelleme: 1 Şubat 2026",
                    style: TextStyle(
                      fontSize: 14,
                      color: _EmotiColors.skyBlue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Emoti (\"biz\", \"bizim\" veya \"Uygulama\") olarak gizliliğinize önem veriyoruz. Bu Gizlilik Politikası, uygulamamızı kullandığınızda bilgilerinizin nasıl toplandığını, kullanıldığını ve korunduğunu açıklar.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16,
                      color: _EmotiColors.cream,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Sections
            const _PrivacySection(
              title: "1. TOPLANAN BİLGİLER",
              icon: Icons.data_usage,
              content:
                  "Uygulamayı kullanırken aşağıdaki bilgileri toplayabilir ve işleyebiliriz:\n\n"
                  "1.1. Kişisel Bilgiler\n"
                  "• Google Hesap Bilgileri: Uygulamamıza Google ile Giriş Yap (Google Sign-In) özelliği ile giriş yaptığınızda, Google profilinizden Ad, Soyad, E-posta Adresi ve Profil Fotoğrafı bilgilerinizi alırız.\n"
                  "• Kullanıcı Kimliği (User ID): Sistemimizde sizi tanımlamak için benzersiz bir kimlik (Firebase UID) oluşturulur.\n\n"
                  "1.2. Kullanıcı Tarafından Oluşturulan İçerik ve Medya\n"
                  "• Google Drive Erişimi: Uygulamamızdaki \"Birlikte İzle\" özelliğini kullanabilmeniz için Google Drive hesabınızdaki video dosyalarına salt okunur (read-only) erişim izni isteriz. Bu erişim sadece seçtiğiniz videoları oynatmak için kullanılır; dosyalarınızı silmeyiz veya değiştirmeyiz.\n"
                  "• İletişim Verileri: Görüntülü görüşmeleriniz ve anlık mesajlarınız, hizmetin sağlanması amacıyla sunucularımız üzerinden iletilir. Görüntülü görüşmeler (WebRTC) uçtan uca şifrelenir ve kaydedilmez.\n\n"
                  "1.3. Cihaz İzinleri\n"
                  "Uygulamanın çalışması için aşağıdaki izinleri talep edebiliriz:\n"
                  "• Kamera: Görüntülü görüşme yapabilmeniz için.\n"
                  "• Mikrofon: Sesli ve görüntülü görüşme yapabilmeniz için.\n"
                  "• Bildirimler: İndirme durumları veya önemli güncellemeler hakkında sizi bilgilendirmek için.",
            ),
            const _PrivacySection(
              title: "2. BİLGİLERİN KULLANIMI",
              icon: Icons.settings_applications,
              content: "Topladığımız bilgileri şu amaçlarla kullanırız:\n"
                  "• Kullanıcı hesabı oluşturmak ve kimlik doğrulaması yapmak.\n"
                  "• Görüntülü görüşme ve birlikte izleme hizmetlerini sağlamak.\n"
                  "• Uygulama hatalarını tespit etmek ve performansı iyileştirmek.\n"
                  "• Kullanıcı desteği sağlamak.",
            ),
            const _PrivacySection(
              title: "3. BİLGİLERİN PAYLAŞILMASI",
              icon: Icons.share,
              content:
                  "Kişisel verilerinizi üçüncü taraflara satmayız. Bilgileriniz yalnızca aşağıdaki durumlarda paylaşılabilir:\n"
                  "• Hizmet Sağlayıcılar: Altyapı ve veri tabanı hizmetleri için Google Firebase kullanmaktayız.\n"
                  "• Yasal Zorunluluklar: Kanunen gerekli olduğu durumlarda resmi makamlarla paylaşılabilir.",
            ),
            const _PrivacySection(
              title: "4. VERİ GÜVENLİĞİ",
              icon: Icons.security,
              content:
                  "Verileriniz endüstri standardı güvenlik önlemleri (HTTPS/TLS) ile şifrelenerek iletilir ve güvenli sunucularda saklanır. Ancak, internet üzerinden yapılan hiçbir iletimin %100 güvenli olmadığını unutmayınız.",
            ),
            const _PrivacySection(
              title: "5. HESABIN SİLİNMESİ VE VERİ TALEPLERİ",
              icon: Icons.delete_forever,
              content:
                  "Kullanıcılar, hesaplarının ve ilişkili tüm verilerin silinmesini talep etme hakkına sahiptir.\n\n"
                  "Hesabınızı silmek isterseniz, lütfen aşağıdaki e-posta adresine \"HESAP SİLME TALEBİ\" konulu bir e-posta gönderin:\n\n"
                  "Talebini bize ulaştığında, kimliğinizi doğruladıktan sonra hesabınız ve verileriniz sistemlerimizden kalıcı olarak silinecektir.",
            ),
            const _PrivacySection(
              title: "6. DEĞİŞİKLİKLER",
              icon: Icons.update,
              content:
                  "Bu gizlilik politikasını zaman zaman güncelleyebiliriz. Önemli değişiklikler olduğunda uygulama üzerinden sizi bilgilendireceğiz.",
            ),

            // Contact Section
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: _EmotiColors.darkABlue,
                borderRadius: BorderRadius.circular(16),
                border:
                    Border.all(color: _EmotiColors.skyBlue.withOpacity(0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    children: [
                      Icon(Icons.contact_mail, color: _EmotiColors.skyBlue),
                      SizedBox(width: 10),
                      Text(
                        "7. İLETİŞİM",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: _EmotiColors.cream,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Gizlilik politikamızla ilgili sorularınız için bizimle iletişime geçebilirsiniz:",
                    style: TextStyle(
                      fontSize: 14,
                      color: _EmotiColors.cream,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 10),
                  _ContactRow(label: "E-posta", value: "info.esceai@gmail.com"),
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

class _PrivacySection extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;

  const _PrivacySection({
    required this.title,
    required this.content,
    required this.icon,
  });

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
            color: Colors.black.withOpacity(0.2),
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
          Divider(color: _EmotiColors.mutedBlue.withOpacity(0.2), height: 24),
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
  final String label;
  final String value;
  const _ContactRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$label: ",
          style: const TextStyle(
            color: _EmotiColors.skyBlue,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: _EmotiColors.cream,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
