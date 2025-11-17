import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/skill_items.dart';
import 'animated_widgets.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 500.0,
      ),
      child: Column(
        children: [
          // platforms
          for (int i = 0; i < platformItems.length; i++)
            SlideInAnimation(
              offset: const Offset(-0.2, 0),
              delay: Duration(milliseconds: 100 * i),
              child: HoverAnimation(
                scale: 1.03,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 5.0),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        CustomColor.bgLight2,
                        CustomColor.bgLight2.withOpacity(0.8),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: CustomColor.blueSecondary.withOpacity(0.3),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: CustomColor.bluePrimary.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 20.0,
                    ),
                    leading: Image.asset(
                      platformItems[i]["img"],
                      width: 26.0,
                    ),
                    title: Text(
                      platformItems[i]["title"],
                      style: const TextStyle(
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          const SizedBox(height: 50),

          // skills
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            alignment: WrapAlignment.center,
            children: [
              for (int i = 0; i < skillItems.length; i++)
                ScaleInAnimation(
                  delay: Duration(milliseconds: 50 * i + 500),
                  child: HoverAnimation(
                    scale: 1.1,
                    child: Chip(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 16.0,
                      ),
                      backgroundColor: CustomColor.bgLight2,
                      side: BorderSide(
                        color: CustomColor.blueSecondary.withOpacity(0.5),
                        width: 1.5,
                      ),
                      elevation: 4,
                      shadowColor: CustomColor.bluePrimary.withOpacity(0.3),
                      label: Text(
                        skillItems[i]["title"],
                        style: const TextStyle(
                          color: CustomColor.whitePrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      avatar: Image.asset(skillItems[i]["img"]),
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
