import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';

class DuaIqraPrivacyPolicyPage extends StatelessWidget {
  const DuaIqraPrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.scaffoldBg,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("GİZLİLİK POLİTİKASI"),
        backgroundColor: CustomColor.bgLight1,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          children: [
            // Header Icon
            const Center(
              child: Icon(
                Icons.privacy_tip_outlined,
                size: 80,
                color: CustomColor.bluePrimary,
              ),
            ),
            const SizedBox(height: 20),

            // Intro Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: CustomColor.bgLight1,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: CustomColor.bgLight2),
              ),
              child: Column(
                children: const [
                  Text(
                    "Son Güncelleme: 26 Ocak 2026",
                    style: TextStyle(
                      fontSize: 14,
                      color: CustomColor.hintDark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Dua Iqra uygulaması (\"Uygulama\") olarak gizliliğinize önem veriyoruz. Bu Gizlilik Politikası, uygulamamızı kullandığınızda kişisel verilerinizin nasıl toplandığını, kullanıldığını ve paylaşıldığını açıklar.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16,
                      color: CustomColor.whiteSecondary,
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
                  "Uygulamamızı kullanırken aşağıdaki türde bilgileri toplayabiliriz:\n\n"
                  "a) Kişisel Olmayan Bilgiler:\n"
                  "Uygulamayı kullanımınızla ilgili, kimliğinizi doğrudan ortaya çıkarmayan teknik veriler toplayabiliriz. Bu veriler şunları içerebilir:\n"
                  "• Cihaz marka ve modeli\n"
                  "• İşletim sistemi sürümü\n"
                  "• Uygulama çökme raporları (Crash logs)\n"
                  "• Kullanım istatistikleri ve performans verileri\n\n"
                  "b) Konum Bilgileri (Eğer izin verirseniz):\n"
                  "Uygulama, namaz vakitlerini ve kıble yönünü doğru hesaplayabilmek için hassas konum verilerinize (GPS) ihtiyaç duyabilir. Bu veriler yalnızca uygulamanın işlevselliği için kullanılır ve kaydedilmez.",
            ),
            const _PrivacySection(
              title: "2. BİLGİLERİN KULLANIMI",
              icon: Icons.settings_applications,
              content: "Topladığımız bilgileri şu amaçlarla kullanabiliriz:\n"
                  "• Uygulamanın temel işlevlerini (namaz vakitleri, dua içerikleri vb.) sağlamak.\n"
                  "• Uygulama performansını iyileştirmek ve hataları gidermek.\n"
                  "• Kullanıcı deneyimini kişiselleştirmek.",
            ),
            const _PrivacySection(
              title: "3. ÜÇÜNCÜ TARAF HİZMETLER",
              icon: Icons.link,
              content:
                  "Uygulama, hizmetlerimizi geliştirmek ve analiz etmek için üçüncü taraf hizmet sağlayıcıları kullanabilir. Bu sağlayıcılar kendi gizlilik politikalarına sahiptir:\n\n"
                  "• Google Firebase (Analiz ve Veritabanı hizmetleri için)\n"
                  "• Google AdMob (Eğer reklam gösterimi varsa)\n\n"
                  "Bu hizmetler, cihazınızdaki reklam kimliği (Advertising ID) gibi verileri toplayabilir.",
            ),
            const _PrivacySection(
              title: "4. VERİ GÜVENLİĞİ",
              icon: Icons.security,
              content:
                  "Verilerinizin güvenliğini sağlamak için endüstri standardı güvenlik önlemleri alıyoruz. Ancak, internet üzerinden yapılan hiçbir iletimin %100 güvenli olmadığını lütfen unutmayın.",
            ),
            const _PrivacySection(
              title: "5. ÇOCUKLARIN GİZLİLİĞİ",
              icon: Icons.child_care,
              content:
                  "Bu uygulama, bilerek 13 yaşın altındaki çocuklardan kişisel bilgi toplamaz. Eğer bir ebeveynseniz ve çocuğunuzun bize bilgi sağladığını fark ederseniz, lütfen bizimle iletişime geçin.",
            ),
            const _PrivacySection(
              title: "6. BU POLİTİKADAKİ DEĞİŞİKLİKLER",
              icon: Icons.update,
              content:
                  "Gizlilik Politikamızı zaman zaman güncelleyebiliriz. Değişiklikler bu sayfada yayınlanacaktır. Güncellemelerden haberdar olmak için bu sayfayı periyodik olarak kontrol etmeniz önerilir.",
            ),

            const _PrivacySection(
              title: "7. HESAP SİLME TALEBİ",
              icon: Icons.delete_forever,
              content:
                  "Hesabınızı silmek isterseniz, lütfen kayıtlı e-posta adresinizden 'Hesap Silme Talebi' konulu bir e-posta gönderin. Talebiniz 7 iş günü içinde işleme alınacaktır.\n\n"
                  "Hesap silme talepleri için iletişim: info.esceai@gmail.com",
            ),

            // Contact Section
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: CustomColor.bgLight1.withOpacity(0.5),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                    color: CustomColor.blueSecondary.withOpacity(0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    children: [
                      Icon(Icons.contact_mail, color: CustomColor.bluePrimary),
                      SizedBox(width: 10),
                      Text(
                        "8. İLETİŞİM",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.whitePrimary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Gizlilik Politikamızla ilgili sorularınız veya önerileriniz varsa, lütfen bizimle iletişime geçin:",
                    style: TextStyle(
                      fontSize: 14,
                      color: CustomColor.whiteSecondary,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 10),
                  _ContactRow(
                      label: "E-posta", value: "cengizhankkaya@gmail.com"),
                  SizedBox(height: 5),
                  _ContactRow(label: "Geliştirici", value: "Esce"),
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
        color: CustomColor.bgLight1,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
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
            color: CustomColor.bluePrimary,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: CustomColor.whitePrimary,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
