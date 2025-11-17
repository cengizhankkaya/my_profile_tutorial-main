import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../utils/project_utils.dart';
import 'project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        children: [
          // Work projects title
          const Text(
            "Projelerim",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 30),
          if (workProjectUtils.isNotEmpty) ...[
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "İş projeleri",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: CustomColor.whitePrimary,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: Column(
                children: [
                  for (final project in workProjectUtils)
                    ProjectCardWidget(project: project),
                ],
              ),
            ),
            const SizedBox(height: 45),
          ],
          if (hobbyProjectUtils.isNotEmpty) ...[
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Hobi projeleri",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: CustomColor.whitePrimary,
                ),
              ),
            ),
            const SizedBox(height: 20),
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
