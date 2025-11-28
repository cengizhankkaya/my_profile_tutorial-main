import 'package:flutter/material.dart';
// ignore: deprecated_member_use
import 'dart:js' as js;

import '../constants/colors.dart';
import '../constants/sns_links.dart';
import 'animated_widgets.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({
    required this.onContactTap,
    super.key,
  });

  final VoidCallback onContactTap;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      height: screenHeight / 1.2,
      constraints: const BoxConstraints(
        minHeight: 350.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SlideInAnimation(
            offset: const Offset(-0.3, 0),
            delay: const Duration(milliseconds: 200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // intro message with gradient
                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [
                      CustomColor.whitePrimary,
                      CustomColor.bluePrimary,
                    ],
                  ).createShader(bounds),
                  child: const Text(
                    "Merhaba,\nCengizhan Kaya\nFlutter Geliştiricisiyim",
                    style: TextStyle(
                      fontSize: 30,
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // contact btn with animation
                SlideInAnimation(
                  offset: const Offset(0, 0.2),
                  delay: const Duration(milliseconds: 400),
                  child: HoverAnimation(
                    child: Container(
                      width: 250.0,
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
                        onPressed: onContactTap,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "İletişime geç",
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // github btn with animation
                SlideInAnimation(
                  offset: const Offset(0, 0.2),
                  delay: const Duration(milliseconds: 500),
                  child: HoverAnimation(
                    child: Container(
                      width: 250.0,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF4CAF50),
                            Color(0xFF2E7D32),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF4CAF50).withOpacity(0.4),
                            blurRadius: 15,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          js.context.callMethod('open', [SnsLinks.github]);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "GitHub",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // avatar img with animation
          ScaleInAnimation(
            delay: const Duration(milliseconds: 600),
            child: GlowContainer(
              glowColor: CustomColor.bluePrimary,
              blurRadius: 30,
              spreadRadius: 10,
              child: Image.asset(
                "assets/my_flutter_avatar.png",
                width: screenWidth / 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
