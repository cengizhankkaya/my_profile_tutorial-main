import 'package:flutter/material.dart';
// ignore: deprecated_member_use
import 'dart:js' as js;

import '../constants/colors.dart';
import '../constants/sns_links.dart';
import 'animated_widgets.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({
    required this.onContactTap,
    super.key,
  });

  final VoidCallback onContactTap;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final isSmallScreen = screenWidth < 400;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? 20.0 : 30.0,
        vertical: 20.0,
      ),
      height: screenHeight,
      constraints: const BoxConstraints(
        minHeight: 560.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // avatar img with animation
          ScaleInAnimation(
            delay: const Duration(milliseconds: 200),
            child: GlowContainer(
              glowColor: CustomColor.bluePrimary,
              blurRadius: 25,
              spreadRadius: 8,
              child: ShaderMask(
                shaderCallback: (bounds) {
                  return LinearGradient(colors: [
                    CustomColor.scaffoldBg.withValues(alpha: 0.6),
                    CustomColor.scaffoldBg.withValues(alpha: 0.6),
                  ]).createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
                child: Image.asset(
                  "assets/my_flutter_avatar.png",
                  width: screenWidth - (isSmallScreen ? 40.0 : 60.0),
                ),
              ),
            ),
          ),
          SizedBox(height: isSmallScreen ? 20 : 30),
          // intro message with gradient
          SlideInAnimation(
            offset: const Offset(0, 0.3),
            delay: const Duration(milliseconds: 400),
            child: ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [
                  CustomColor.whitePrimary,
                  CustomColor.bluePrimary,
                ],
              ).createShader(bounds),
              child: Text(
                "Merhaba,\nCengizhan Kaya\nFlutter Geliştiricisiyim",
                style: TextStyle(
                  fontSize: isSmallScreen ? 20 : 24,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          // contact btn with animation
          SlideInAnimation(
            offset: const Offset(0, 0.2),
            delay: const Duration(milliseconds: 600),
            child: HoverAnimation(
              child: Container(
                width: isSmallScreen ? double.infinity : 190.0,
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
          SizedBox(height: isSmallScreen ? 15 : 15),
          // github btn with animation
          SlideInAnimation(
            offset: const Offset(0, 0.2),
            delay: const Duration(milliseconds: 700),
            child: HoverAnimation(
              child: Container(
                width: isSmallScreen ? double.infinity : 190.0,
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
    );
  }
}
