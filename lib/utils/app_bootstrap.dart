import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/abc1234_privacy_policy_page.dart';
import 'package:my_portfolio/pages/dua_iqra_privacy_policy_page.dart';
import 'package:my_portfolio/pages/emoti_privacy_policy_page.dart';
import 'package:my_portfolio/pages/home_page.dart';
import 'package:my_portfolio/pages/pozal_privacy_policy_page.dart';
import 'package:my_portfolio/pages/support_page.dart';

/// Web'de doğrudan URL (hash veya path) ile açılışta doğru ekranı seçer.
String readWebLaunchPath() {
  if (!kIsWeb) return '/';
  const allowed = {
    '/support',
    '/dua-iqra-privacy-policy',
    '/emoti-privacy-policy',
    '/abc1234-privacy-policy',
    '/pozal-privacy-policy',
  };
  final uri = Uri.base;
  final String candidate;
  if (uri.fragment.isNotEmpty) {
    candidate = uri.fragment.startsWith('/')
        ? uri.fragment
        : '/${uri.fragment}';
  } else {
    candidate = uri.path.isEmpty || uri.path == '/' ? '/' : uri.path;
  }
  if (candidate != '/' && allowed.contains(candidate)) {
    return candidate;
  }
  return '/';
}

/// İlk frame'de gösterilecek kök widget (derin bağlantı desteği).
Widget launchBootstrapHome() {
  if (!kIsWeb) return const HomePage();
  switch (readWebLaunchPath()) {
    case '/support':
      return const SupportPage();
    case '/dua-iqra-privacy-policy':
      return const DuaIqraPrivacyPolicyPage();
    case '/emoti-privacy-policy':
      return const EmotiPrivacyPolicyPage();
    case '/abc1234-privacy-policy':
      return const Abc1234PrivacyPolicyPage();
    case '/pozal-privacy-policy':
      return const PozalPrivacyPolicyPage();
    default:
      return const HomePage();
  }
}
