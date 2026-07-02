import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/support_email.dart';
import 'package:my_portfolio/constants/privacy_policy_lang.dart';
import 'package:my_portfolio/widgets/privacy_language_selector.dart';
import 'package:url_launcher/url_launcher.dart';

/// App Store / Play Console için tek destek sayfası (tüm uygulamalar).
class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  PrivacyPolicyLang _lang = PrivacyPolicyLang.tr;

  Future<void> _openMailto(String email, String subject) async {
    final uri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {'subject': subject},
    );
    await launchUrl(
      uri,
      mode: LaunchMode.platformDefault,
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = _SupportCopy(_lang);

    return Scaffold(
      backgroundColor: CustomColor.scaffoldBg,
      appBar: AppBar(
        automaticallyImplyLeading: true,
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
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.support_agent,
                  size: 72,
                  color: CustomColor.bluePrimary.withValues(alpha: 0.9),
                ),
                const SizedBox(height: 12),
                Text(
                  t.headline,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.whitePrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  t.subhead,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    color: CustomColor.whiteSecondary,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 24),
                _Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SectionTitle(icon: Icons.schedule, text: t.responseTitle),
                      const SizedBox(height: 8),
                      Text(
                        t.responseBody,
                        style: const TextStyle(
                          color: CustomColor.whiteSecondary,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SectionTitle(icon: Icons.mail_outline, text: t.emailTitle),
                      const SizedBox(height: 8),
                      Text(
                        t.emailIntro,
                        style: const TextStyle(
                          color: CustomColor.whiteSecondary,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 16),
                      FilledButton.icon(
                        onPressed: () => _openMailto(
                          kSupportEmail,
                          t.mailSubject,
                        ),
                        icon: const Icon(Icons.email_outlined),
                        label: Text(t.openEmailButton),
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const SelectableText(
                        kSupportEmail,
                        style: TextStyle(
                          color: CustomColor.bluePrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SectionTitle(
                        icon: Icons.info_outline,
                        text: t.beforeEmailTitle,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        t.beforeEmailBody,
                        style: const TextStyle(
                          color: CustomColor.whiteSecondary,
                          height: 1.55,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SectionTitle(
                        icon: Icons.store_mall_directory_outlined,
                        text: t.storeTitle,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        t.storeBody,
                        style: const TextStyle(
                          color: CustomColor.whiteSecondary,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SectionTitle(
                        icon: Icons.policy_outlined,
                        text: t.privacyTitle,
                      ),
                      const SizedBox(height: 12),
                      _PolicyLink(
                        label: t.privacyDua,
                        route: '/dua-iqra-privacy-policy',
                      ),
                      _PolicyLink(
                        label: t.privacyEmoti,
                        route: '/emoti-privacy-policy',
                      ),
                      _PolicyLink(
                        label: t.privacyAbc,
                        route: '/abc1234-privacy-policy',
                      ),
                      _PolicyLink(
                        label: t.privacyPozal,
                        route: '/pozal-privacy-policy',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  t.footerNote,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: CustomColor.hintDark.withValues(alpha: 0.95),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PolicyLink extends StatelessWidget {
  const _PolicyLink({required this.label, required this.route});

  final String label;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: TextButton(
        style: TextButton.styleFrom(
          alignment: Alignment.centerLeft,
          foregroundColor: CustomColor.bluePrimary,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        ),
        onPressed: () => Navigator.of(context).pushNamed(route),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.arrow_forward_ios, size: 14),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                label,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: CustomColor.bgLight1,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: CustomColor.bgLight2),
      ),
      child: child,
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: CustomColor.bluePrimary, size: 22),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
        ),
      ],
    );
  }
}

class _SupportCopy {
  _SupportCopy(this.l);
  final PrivacyPolicyLang l;
  bool get en => l == PrivacyPolicyLang.en;

  String get appBarTitle => en ? 'Support' : 'Destek';

  String get headline =>
      en ? 'Customer support' : 'Müşteri desteği';

  String get subhead => en
      ? 'Official support for all mobile applications published by this developer. Use the email below for bugs, account help, and general questions. App Store and Google Play require a reachable support channel — this page is that channel.'
      : 'Bu geliştirici hesabıyla yayımlanan tüm mobil uygulamalar için resmi destek sayfasıdır. Hata bildirimi, hesap yardımı ve genel sorular için aşağıdaki e-postayı kullanın. App Store ve Google Play, erişilebilir bir destek kanalı ister; bu sayfa o kanaldır.';

  String get responseTitle =>
      en ? 'Response time' : 'Yanıt süresi';

  String get responseBody => en
      ? 'We aim to reply within 2 business days (often sooner). Complex issues may need more time; we will acknowledge your message first.'
      : 'Hedefimiz 2 iş günü içinde yanıt vermektir (çoğu zaman daha kısa sürer). Karmaşık konularda daha fazla süre gerekebilir; önce mesajınızı aldığımızı bildiririz.';

  String get emailTitle =>
      en ? 'Contact us' : 'Bize ulaşın';

  String get emailIntro => en
      ? 'Support email for all apps (bugs, account help, data requests):'
      : 'Tüm uygulamalar için destek e-postası (hata, hesap yardımı, veri talepleri):';

  String get openEmailButton =>
      en ? 'Open email app' : 'E-posta uygulamasını aç';

  String get mailSubject =>
      en ? 'App support request' : 'Uygulama destek talebi';

  String get beforeEmailTitle =>
      en ? 'Before you write' : 'Yazmadan önce';

  String get beforeEmailBody => en
      ? '• App name (e.g. Dua Iqra, Emoti, Abc1234)\n'
          '• Platform and OS version (iOS 18, Android 15, …)\n'
          '• Steps to reproduce the issue\n'
          '• Screenshots if helpful\n\n'
          'This helps us resolve your request faster.'
      : '• Uygulama adı (ör. Dua Iqra, Emoti, Abc1234)\n'
          '• Platform ve işletim sistemi sürümü (iOS 18, Android 15, …)\n'
          '• Sorunu yeniden üretmek için adımlar\n'
          '• Varsa ekran görüntüleri\n\n'
          'Bu bilgiler talebinizi daha hızlı çözmemize yardımcı olur.';

  String get storeTitle =>
      en ? 'App Store & Google Play' : 'App Store ve Google Play';

  String get storeBody => en
      ? 'For refunds or subscription management, please use Apple or Google’s purchase tools in addition to contacting us. We are happy to help with technical and account issues by email.'
      : 'İade veya abonelik yönetimi için Apple veya Google’ın satın alma / abonelik araçlarını da kullanabilirsiniz. Teknik ve hesap konularında e-posta ile yardımcı olmaktan memnuniyet duyarız.';

  String get privacyTitle =>
      en ? 'Privacy policies' : 'Gizlilik politikaları';

  String get privacyDua =>
      en ? 'Dua Iqra — Privacy policy' : 'Dua Iqra — Gizlilik politikası';

  String get privacyEmoti =>
      en ? 'Emoti — Privacy policy' : 'Emoti — Gizlilik politikası';

  String get privacyAbc =>
      en ? 'Abc1234 — Privacy policy' : 'Abc1234 — Gizlilik politikası';

  String get privacyPozal =>
      en ? 'Pozal — Privacy policy' : 'Pozal — Gizlilik politikası';

  String get footerNote => en
      ? 'Developer: Cengizhan Kaya. This page is intended for end-user support and review by app stores.'
      : 'Geliştirici: Cengizhan Kaya. Bu sayfa son kullanıcı desteği ve mağaza incelemeleri içindir.';
}
