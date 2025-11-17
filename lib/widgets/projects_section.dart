import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../utils/project_utils.dart';
import 'project_card.dart';
import 'animated_widgets.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;
    final isMobile = screenWidth < 600;
    return Container(
      width: screenWidth,
      padding: EdgeInsets.fromLTRB(
        isSmallScreen ? 20 : 25, 
        20, 
        isSmallScreen ? 20 : 25, 
        60
      ),
      child: Column(
        children: [
          // Work projects title
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
                "Projelerim",
                style: TextStyle(
                  fontSize: isSmallScreen ? 20 : isMobile ? 22 : 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: isSmallScreen ? 20 : 30),
          if (workProjectUtils.isNotEmpty) ...[
            FadeInAnimation(
              delay: const Duration(milliseconds: 200),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "İş projeleri",
                  style: TextStyle(
                    fontSize: isSmallScreen ? 16 : 18,
                    fontWeight: FontWeight.w600,
                    color: CustomColor.whitePrimary,
                  ),
                ),
              ),
            ),
            SizedBox(height: isSmallScreen ? 16 : 20),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: Column(
                children: [
                  for (final project in workProjectUtils)
                    ProjectCardWidget(project: project),
                ],
              ),
            ),
            SizedBox(height: isSmallScreen ? 30 : 45),
          ],
          if (hobbyProjectUtils.isNotEmpty) ...[
            if (workProjectUtils.isNotEmpty)
            SizedBox(height: isSmallScreen ? 16 : 20),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: Column(
                children: [
                  for (final project in hobbyProjectUtils)
                    ProjectCardWidget(project: project),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
