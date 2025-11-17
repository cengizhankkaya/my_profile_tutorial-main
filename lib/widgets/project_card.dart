import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/project_utils.dart';

import '../constants/colors.dart';
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
    final cardWidth = screenWidth > 1200 ? 1100.0 : screenWidth - 40;
    final galleryScreens = project.screenshots
        .where((path) => path.trim() != project.image.trim())
        .toList();
    final displayScreens =
        galleryScreens.isNotEmpty ? galleryScreens : project.screenshots;
    final galleryAspectRatio = project.galleryAspectRatio ?? (9 / 19.5);
    final isLandscape = galleryAspectRatio >= 1;
    final galleryHeight = isLandscape ? 260.0 : 380.0;
    final galleryItemWidth = isLandscape ? 360.0 : 200.0;
    return Container(
      width: cardWidth,
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: CustomColor.bgLight2,
        border: Border.all(
          color: CustomColor.bgLight1,
          width: 1,
        ),
        boxShadow: [
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(26),
                child: Image.asset(
                  project.image,
                  width: 140,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.title,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      project.subtitle,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.4,
                        color: CustomColor.whiteSecondary,
                      ),
                    ),
                    if (project.techStack.isNotEmpty) ...[
                      const SizedBox(height: 18),
                      const Text(
                        "Teknolojiler & State Management",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: CustomColor.whitePrimary,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: project.techStack
                            .map(
                              (tech) => Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: CustomColor.bgLight1.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color:
                                        CustomColor.yellowSecondary.withOpacity(
                                      0.4,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  tech,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: CustomColor.whiteSecondary,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                    const SizedBox(height: 20),
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
            const SizedBox(height: 32),
            const Text(
              "Tanıtım ekranları",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: CustomColor.whitePrimary,
              ),
            ),
            const SizedBox(height: 18),
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
                      const SizedBox(width: 24),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: galleryItemWidth,
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
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: CustomColor.bgLight1,
          border: Border.all(
            color: CustomColor.yellowSecondary.withOpacity(0.4),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              assetPath,
              width: 20,
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                color: CustomColor.whitePrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
