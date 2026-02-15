import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/home_page.dart';
import 'package:my_portfolio/styles/theme.dart';
import 'package:my_portfolio/pages/dua_iqra_privacy_policy_page.dart';
import 'package:my_portfolio/pages/emoti_privacy_policy_page.dart';

void main() {
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
      home: const HomePage(),
      routes: {
        '/dua-iqra-privacy-policy': (context) =>
            const DuaIqraPrivacyPolicyPage(),
        '/emoti-privacy-policy': (context) => const EmotiPrivacyPolicyPage(),
      },
    );
  }
}
