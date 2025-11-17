import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/project_utils.dart';

import '../constants/colors.dart';
import 'animated_widgets.dart';
import 'dart:js' as js;

class ProjectCardWidget extends StatefulWidget {
  const ProjectCardWidget({
    super.key,
    required this.project,
  });
  final ProjectUtils project;

  @override
  State<ProjectCardWidget> createState() => _ProjectCardWidgetState();
}

class _ProjectCardWidgetState extends State<ProjectCardWidget> {
  late final ScrollController _screensController;

  @override
  void initState() {
    super.initState();
    _screensController = ScrollController();
  }

  @override
  void dispose() {
    _screensController.dispose();
    super.dispose();
  }

  ProjectUtils get project => widget.project;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isSmallScreen = screenWidth < 400;
    final cardWidth = screenWidth > 1200 ? 1100.0 : screenWidth - (isMobile ? 50 : 40);
    final galleryScreens = project.screenshots
        .where((path) => path.trim() != project.image.trim())
        .toList();
    final displayScreens =
        galleryScreens.isNotEmpty ? galleryScreens : project.screenshots;
    final galleryAspectRatio = project.galleryAspectRatio ?? (9 / 19.5);
    final isLandscape = galleryAspectRatio >= 1;
    final galleryHeight = isLandscape ? 260.0 : 380.0;
    final galleryItemWidth = isLandscape ? 360.0 : 200.0;
    return FadeInAnimation(
      delay: const Duration(milliseconds: 100),
      child: HoverAnimation(
        scale: 1.02,
        child: Container(
          width: cardWidth,
          margin: EdgeInsets.symmetric(vertical: isMobile ? 12 : 16),
          padding: EdgeInsets.all(isSmallScreen ? 16 : isMobile ? 20 : 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                CustomColor.bgLight2,
                CustomColor.bgLight2.withOpacity(0.9),
              ],
            ),
            border: Border.all(
              color: CustomColor.blueSecondary.withOpacity(0.3),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: CustomColor.bluePrimary.withOpacity(0.1),
                blurRadius: 30,
                offset: const Offset(0, 20),
                spreadRadius: 2,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 30,
                offset: const Offset(0, 20),
              ),
            ],
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isMobile)
            // Mobil görünüm: Dikey düzen
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ScaleInAnimation(
                    delay: const Duration(milliseconds: 200),
                    child: GlowContainer(
                      glowColor: CustomColor.bluePrimary,
                      blurRadius: 15,
                      spreadRadius: 3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(26),
                        child: Image.asset(
                          project.image,
                          width: isSmallScreen ? 100 : 120,
                          height: isSmallScreen ? 100 : 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: isSmallScreen ? 16 : 20),
                Text(
                  project.title,
                  style: TextStyle(
                    fontSize: isSmallScreen ? 20 : 22,
                    fontWeight: FontWeight.w700,
                    color: CustomColor.whitePrimary,
                  ),
                ),
                SizedBox(height: isSmallScreen ? 8 : 12),
                Text(
                  project.subtitle,
                  style: TextStyle(
                    fontSize: isSmallScreen ? 13 : 14,
                    height: 1.6,
                    color: CustomColor.whiteSecondary,
                  ),
                  softWrap: true,
                  textAlign: TextAlign.left,
                ),
                if (project.techStack.isNotEmpty) ...[
                  SizedBox(height: isSmallScreen ? 12 : 18),
                  Text(
                    "Teknolojiler & State Management",
                    style: TextStyle(
                      fontSize: isSmallScreen ? 12 : 14,
                      fontWeight: FontWeight.w600,
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                  SizedBox(height: isSmallScreen ? 8 : 10),
                  Wrap(
                    spacing: isSmallScreen ? 6 : 8,
                    runSpacing: isSmallScreen ? 6 : 8,
                    children: project.techStack
                        .map(
                          (tech) => Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: isSmallScreen ? 10 : 12, 
                                vertical: isSmallScreen ? 5 : 6),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  CustomColor.bgLight1.withOpacity(0.9),
                                  CustomColor.bgLight1.withOpacity(0.7),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: CustomColor.blueSecondary.withOpacity(0.6),
                                width: 1.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: CustomColor.blueSecondary.withOpacity(0.2),
                                  blurRadius: 8,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Text(
                              tech,
                              style: TextStyle(
                                fontSize: isSmallScreen ? 11 : 13,
                                color: CustomColor.whiteSecondary,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
                SizedBox(height: isSmallScreen ? 16 : 20),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    if (project.androidLink != null)
                      _StoreButton(
                        label: "Google Play'de aç",
                        assetPath: "assets/android_icon.png",
                        onTap: () => js.context
                            .callMethod("open", [project.androidLink]),
                      ),
                    if (project.iosLink != null)
                      _StoreButton(
                        label: "App Store'da aç",
                        assetPath: "assets/ios_icon.png",
                        onTap: () =>
                            js.context.callMethod("open", [project.iosLink]),
                      ),
                    if (project.webLink != null)
                      _StoreButton(
                        label: "Web'de görüntüle",
                        assetPath: "assets/web_icon.png",
                        onTap: () =>
                            js.context.callMethod("open", [project.webLink]),
                      ),
                  ],
                ),
              ],
            )
          else
            // Desktop görünüm: Yatay düzen
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ScaleInAnimation(
                  delay: const Duration(milliseconds: 200),
                  child: GlowContainer(
                    glowColor: CustomColor.bluePrimary,
                    blurRadius: 15,
                    spreadRadius: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(26),
                      child: Image.asset(
                        project.image,
                        width: 140,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project.title,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: CustomColor.whitePrimary,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        project.subtitle,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          color: CustomColor.whiteSecondary,
                        ),
                        softWrap: true,
                        textAlign: TextAlign.left,
                      ),
                      if (project.techStack.isNotEmpty) ...[
                        SizedBox(height: 18),
                        Text(
                          "Teknolojiler & State Management",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: CustomColor.whitePrimary,
                          ),
                        ),
                        SizedBox(height: 10),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: project.techStack
                              .map(
                                (tech) => Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12, 
                                      vertical: 6),
                                  decoration: BoxDecoration(
                                    color: CustomColor.bgLight1.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color:
                                          CustomColor.blueSecondary.withOpacity(
                                        0.4,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    tech,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: CustomColor.whiteSecondary,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                      SizedBox(height: 20),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          if (project.androidLink != null)
                            _StoreButton(
                              label: "Google Play'de aç",
                              assetPath: "assets/android_icon.png",
                              onTap: () => js.context
                                  .callMethod("open", [project.androidLink]),
                            ),
                          if (project.iosLink != null)
                            _StoreButton(
                              label: "App Store'da aç",
                              assetPath: "assets/ios_icon.png",
                              onTap: () =>
                                  js.context.callMethod("open", [project.iosLink]),
                            ),
                          if (project.webLink != null)
                            _StoreButton(
                              label: "Web'de görüntüle",
                              assetPath: "assets/web_icon.png",
                              onTap: () =>
                                  js.context.callMethod("open", [project.webLink]),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          if (displayScreens.isNotEmpty) ...[
            SizedBox(height: isSmallScreen ? 24 : 32),
            Text(
              "Tanıtım ekranları",
              style: TextStyle(
                fontSize: isSmallScreen ? 13 : 15,
                fontWeight: FontWeight.w600,
                color: CustomColor.whitePrimary,
              ),
            ),
            SizedBox(height: isSmallScreen ? 12 : 18),
            SizedBox(
              height: galleryHeight,
              width: double.infinity,
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                    PointerDeviceKind.stylus,
                    PointerDeviceKind.unknown,
                  },
                ),
                child: ListView.separated(
                  controller: _screensController,
                  padding: const EdgeInsets.only(bottom: 12),
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: displayScreens.length,
                  separatorBuilder: (context, index) =>
                      SizedBox(width: isSmallScreen ? 16 : 24),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: isSmallScreen 
                          ? (isLandscape ? 280.0 : 160.0) 
                          : galleryItemWidth,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          color: CustomColor.bgLight1,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(28),
                          child: AspectRatio(
                            aspectRatio: galleryAspectRatio,
                            child: Image.asset(
                              displayScreens[index],
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ],
      ),
      ),
      ),
    );
  }
}

class _StoreButton extends StatelessWidget {
  const _StoreButton({
    required this.label,
    required this.assetPath,
    required this.onTap,
  });

  final String label;
  final String assetPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;
    return HoverAnimation(
      scale: 1.05,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isSmallScreen ? 14 : 18, 
            vertical: isSmallScreen ? 8 : 10
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: LinearGradient(
              colors: [
                CustomColor.bgLight1,
                CustomColor.bgLight1.withOpacity(0.8),
              ],
            ),
            border: Border.all(
              color: CustomColor.blueSecondary.withOpacity(0.6),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: CustomColor.blueSecondary.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              assetPath,
              width: isSmallScreen ? 18 : 20,
            ),
            SizedBox(width: isSmallScreen ? 8 : 10),
            Flexible(
              child: Text(
                label,
                style: TextStyle(
                  color: CustomColor.whitePrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: isSmallScreen ? 12 : 14,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}
