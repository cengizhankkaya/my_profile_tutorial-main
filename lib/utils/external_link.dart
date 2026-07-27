import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openExternalLink(String url) async {
  final uri = Uri.tryParse(url);
  if (uri == null) return;

  if (!await canLaunchUrl(uri)) return;

  await launchUrl(
    uri,
    mode: kIsWeb ? LaunchMode.platformDefault : LaunchMode.externalApplication,
  );
}

