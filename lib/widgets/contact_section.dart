import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/sns_links.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart';
import 'animated_widgets.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;
    final isMobile = screenWidth < 600;
    return Container(
      padding: EdgeInsets.fromLTRB(
        isSmallScreen ? 20 : 25, 
        20, 
        isSmallScreen ? 20 : 25, 
        60
      ),
      color: CustomColor.bgLight1,
      child: Column(
        children: [
          // title
          SlideInAnimation(
            offset: const Offset(0, -0.2),
            child: ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [
                  CustomColor.whitePrimary,
                  CustomColor.bluePrimary,
                ],
              ).createShader(bounds),
              child: Text(
                "İletişime geç",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: isSmallScreen ? 20 : isMobile ? 22 : 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),
          SlideInAnimation(
            offset: const Offset(0, 0.2),
            delay: const Duration(milliseconds: 200),
            child: HoverAnimation(
              scale: 1.02,
              child: InkWell(
                onTap: _launchEmail,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 520),
                  padding: EdgeInsets.symmetric(
                    horizontal: isSmallScreen ? 18 : 26,
                    vertical: isSmallScreen ? 22 : 28,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        CustomColor.bluePrimary.withOpacity(0.2),
                        CustomColor.blueSecondary.withOpacity(0.2),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: CustomColor.bluePrimary.withOpacity(0.4),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: CustomColor.bluePrimary.withOpacity(0.25),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.email_outlined,
                        color: CustomColor.bluePrimary,
                        size: isSmallScreen ? 32 : 38,
                      ),
                      const SizedBox(height: 16),
                      SelectableText(
                        SnsLinks.email,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isSmallScreen ? 18 : 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Bu adrese e-posta göndererek dilediğiniz zaman iletişime geçebilirsiniz.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isSmallScreen ? 14 : 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),

          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 300,
            ),
            child: const Divider(),
          ),
          const SizedBox(height: 15),

          // SNS icon button links
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              ScaleInAnimation(
                delay: const Duration(milliseconds: 200),
                child: HoverAnimation(
                  scale: 1.2,
                  child: InkWell(
                    onTap: () => _launchLink(SnsLinks.github),
                    child: GlowContainer(
                      glowColor: Colors.white,
                      blurRadius: 10,
                      spreadRadius: 2,
                      child: Image.asset(
                        "assets/github.png",
                        width: 28,
                      ),
                    ),
                  ),
                ),
              ),
              ScaleInAnimation(
                delay: const Duration(milliseconds: 300),
                child: HoverAnimation(
                  scale: 1.2,
                  child: InkWell(
                    onTap: () => _launchLink(SnsLinks.linkedIn),
                    child: GlowContainer(
                      glowColor: Colors.blue,
                      blurRadius: 10,
                      spreadRadius: 2,
                      child: Image.asset(
                        "assets/linkedin.png",
                        width: 28,
                      ),
                    ),
                  ),
                ),
              ),
              ScaleInAnimation(
                delay: const Duration(milliseconds: 400),
                child: HoverAnimation(
                  scale: 1.2,
                  child: InkWell(
                    onTap: () => _launchLink(SnsLinks.medium),
                    child: GlowContainer(
                      glowColor: Colors.green,
                      blurRadius: 10,
                      spreadRadius: 2,
                      child: Image.asset(
                        "assets/medium.png",
                        width: 28,
                      ),
                    ),
                  ),
                ),
              ),
              ScaleInAnimation(
                delay: const Duration(milliseconds: 500),
                child: HoverAnimation(
                  scale: 1.2,
                  child: InkWell(
                    onTap: () => _launchLink(SnsLinks.instagram),
                    child: GlowContainer(
                      glowColor: Colors.pink,
                      blurRadius: 10,
                      spreadRadius: 2,
                      child: Image.asset(
                        "assets/instagram.png",
                        width: 28,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> _launchEmail() async {
    await _launchLink('mailto:${SnsLinks.email}');
  }

  Future<void> _launchLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
