import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/constants/sns_links.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart';
import 'animated_widgets.dart';
import 'custom_text_field.dart';

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

          const SizedBox(height: 50),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
              maxHeight: 100,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth >= kMinDesktopWidth) {
                  return buildNameEmailFieldDesktop();
                }

                // else
                return buildNameEmailFieldMobile();
              },
            ),
          ),
          const SizedBox(height: 15),
          // message
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: CustomTextField(
              hintText: "Mesajınız",
              maxLines: 16,
            ),
          ),
          const SizedBox(height: 20),
          // send button
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: SlideInAnimation(
              offset: const Offset(0, 0.2),
              delay: const Duration(milliseconds: 300),
              child: HoverAnimation(
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        CustomColor.bluePrimary,
                        CustomColor.blueSecondary,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: CustomColor.bluePrimary.withOpacity(0.4),
                        blurRadius: 15,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Gönder",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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

  Future<void> _launchLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Row buildNameEmailFieldDesktop() {
    return Row(
      children: [
        // name
        Flexible(
          child: CustomTextField(
            hintText: "Adınız",
          ),
        ),
        const SizedBox(width: 15),
        // email
        Flexible(
          child: CustomTextField(
            hintText: "E-posta adresiniz",
          ),
        ),
      ],
    );
  }

  Column buildNameEmailFieldMobile() {
    return Column(
      children: [
        // name
        Flexible(
          child: CustomTextField(
            hintText: "Adınız",
          ),
        ),
        const SizedBox(height: 15),
        // email
        Flexible(
          child: CustomTextField(
            hintText: "E-posta adresiniz",
          ),
        ),
      ],
    );
  }
}
