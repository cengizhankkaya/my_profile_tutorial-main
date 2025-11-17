import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/constants/sns_links.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart';
import 'custom_text_field.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLight1,
      child: Column(
        children: [
          // title
          const Text(
            "İletişime geç",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: CustomColor.whitePrimary,
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
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Gönder"),
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
              InkWell(
                onTap: () => _launchLink(SnsLinks.github),
                child: Image.asset(
                  "assets/github.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () => _launchLink(SnsLinks.linkedIn),
                child: Image.asset(
                  "assets/linkedin.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () => _launchLink(SnsLinks.medium),
                child: Image.asset(
                  "assets/medium.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () => _launchLink(SnsLinks.instagram),
                child: Image.asset(
                  "assets/instagram.png",
                  width: 28,
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
