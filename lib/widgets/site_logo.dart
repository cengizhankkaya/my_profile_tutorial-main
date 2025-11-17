import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart';
import '../constants/sns_links.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({
    super.key,
    this.onTap,
  });
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: const Text(
            "CK",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              color: CustomColor.blueSecondary,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Wrap(
          spacing: 12,
          children: [
            _SocialIconButton(
              assetPath: "assets/github.png",
              onTap: () => _launchLink(SnsLinks.github),
            ),
            _SocialIconButton(
              assetPath: "assets/linkedin.png",
              onTap: () => _launchLink(SnsLinks.linkedIn),
            ),
            _SocialIconButton(
              assetPath: "assets/medium.png",
              onTap: () => _launchLink(SnsLinks.medium),
            ),
            _SocialIconButton(
              assetPath: "assets/instagram.png",
              onTap: () => _launchLink(SnsLinks.instagram),
            ),
          ],
        ),
      ],
    );
  }

  static Future<void> _launchLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }
}

class _SocialIconButton extends StatelessWidget {
  const _SocialIconButton({
    required this.assetPath,
    required this.onTap,
  });

  final String assetPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Image.asset(
        assetPath,
        width: 22,
      ),
    );
  }
}
