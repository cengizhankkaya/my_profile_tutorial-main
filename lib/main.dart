import 'package:flutter/material.dart';
import 'package:my_portfolio/styles/theme.dart';
import 'package:my_portfolio/pages/abc1234_privacy_policy_page.dart';
import 'package:my_portfolio/pages/dua_iqra_privacy_policy_page.dart';
import 'package:my_portfolio/pages/emoti_privacy_policy_page.dart';
import 'package:my_portfolio/pages/support_page.dart';
import 'package:my_portfolio/utils/app_bootstrap.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: kCustomTheme,
      title: 'Cengizhan Kaya',
      home: launchBootstrapHome(),
      routes: {
        '/dua-iqra-privacy-policy': (context) =>
            const DuaIqraPrivacyPolicyPage(),
        '/emoti-privacy-policy': (context) => const EmotiPrivacyPolicyPage(),
        '/abc1234-privacy-policy': (context) =>
            const Abc1234PrivacyPolicyPage(),
        '/support': (context) => const SupportPage(),
      },
    );
  }
}
