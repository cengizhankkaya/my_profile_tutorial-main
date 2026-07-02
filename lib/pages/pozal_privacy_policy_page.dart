import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/support_email.dart';

class PozalPrivacyPolicyPage extends StatelessWidget {
  const PozalPrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.scaffoldBg,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('PRIVACY POLICY'),
        backgroundColor: CustomColor.bgLight1,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/politc/pozakll.jpg',
                  height: 88,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.camera_alt_outlined,
                    size: 80,
                    color: CustomColor.bluePrimary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Pozal',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: CustomColor.whitePrimary,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: CustomColor.bgLight1,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: CustomColor.bgLight2),
              ),
              child: const Column(
                children: [
                  Text(
                    'Last updated: July 2, 2026',
                    style: TextStyle(
                      fontSize: 14,
                      color: CustomColor.hintDark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Pozal ("App") values your privacy. This Privacy Policy explains how your personal data may be collected, used, stored, and protected when you use our pose guide, camera, location, AI, and challenge features.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16,
                      color: CustomColor.whiteSecondary,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const _PrivacySection(
              title: '1. INFORMATION WE COLLECT',
              icon: Icons.data_usage,
              content:
                  'When you use Pozal, the following types of data may be processed:\n\n'
                  'a) Account information:\n'
                  '• Sign-in information from Firebase Authentication\n'
                  '• Google or Apple sign-in information, if you choose to use these methods\n'
                  '• Nickname or profile information you provide in the app\n\n'
                  'b) Photos and media:\n'
                  '• Photos you take, select, edit, save, or submit to app features\n'
                  '• Images used for AI transformation, retouching, pose references, or challenge submissions\n\n'
                  'c) Location data:\n'
                  '• Approximate or precise location, only if you grant permission, to show nearby photo spots and map-based pose suggestions\n\n'
                  'd) Camera and device permissions:\n'
                  '• Camera access for taking photos and using pose guide features\n'
                  '• Photo library access for selecting and saving images\n'
                  '• Notification permission for challenge reminders and app updates\n\n'
                  'e) Motion sensor data:\n'
                  '• Motion sensor readings used only to detect a shake gesture that switches the app theme\n\n'
                  'f) Technical and usage data:\n'
                  '• Device model, operating system version, app version, crash logs, diagnostics, and performance information\n'
                  '• Feature usage information used to improve the app experience\n\n'
                  'g) Locally stored data:\n'
                  '• Preferences such as theme, language, favorites, and app state may be stored on your device',
            ),
            const _PrivacySection(
              title: '2. USE OF INFORMATION',
              icon: Icons.settings_applications,
              content:
                  'We use collected data to:\n'
                  '• Provide camera, pose guide, map, AI transformation, retouch, and challenge features\n'
                  '• Authenticate users and keep accounts secure\n'
                  '• Save user preferences, favorites, submitted photos, and app state\n'
                  '• Show nearby photo spots and location-based pose suggestions\n'
                  '• Process images for features initiated by you\n'
                  '• Display content you submit to challenges to other users for voting and leaderboards\n'
                  '• Detect a shake gesture to switch the app theme\n'
                  '• Send notifications you allow, such as challenge reminders\n'
                  '• Improve app stability, performance, and user experience\n'
                  '• Provide user support and respond to requests',
            ),
            const _PrivacySection(
              title: '3. THIRD-PARTY SERVICES',
              icon: Icons.cloud_outlined,
              content:
                  'Pozal may use third-party services that process data according to their own privacy policies:\n\n'
                  '• Firebase Authentication for sign-in and account management\n'
                  '• Cloud Firestore and Firebase Storage for app data, favorites, challenge content, and uploaded media\n'
                  '• Firebase Cloud Functions for server-side app features\n'
                  '• Google Sign-In and Sign in with Apple for authentication\n'
                  '• Google Gemini or similar AI services for AI-powered features you choose to use\n'
                  '• OpenStreetMap / map tile providers for displaying maps\n\n'
                  'We encourage you to review the privacy policies of these providers for details about their data processing practices.',
            ),
            const _PrivacySection(
              title: '4. CAMERA, PHOTOS, AND AI FEATURES',
              icon: Icons.camera_alt_outlined,
              content:
                  'Camera and photo permissions are used only for features you initiate, such as taking photos, selecting reference images, saving edited photos, using pose guides, AI transformation, retouching, or submitting content to challenges.\n\n'
                  'Images may be processed on your device or, where required by the selected feature, sent to cloud services such as Firebase Storage or AI providers. We do not access your camera or photo library without your permission.',
            ),
            const _PrivacySection(
              title: '5. LOCATION DATA',
              icon: Icons.location_on_outlined,
              content:
                  'If you grant location permission, Pozal may use your location to show nearby photo spots and calculate distance-based suggestions. Location access is optional. You can disable location permission at any time from your device settings.',
            ),
            const _PrivacySection(
              title: '6. USER-GENERATED CONTENT AND CHALLENGES',
              icon: Icons.emoji_events_outlined,
              content:
                  'Pozal includes weekly challenges where you can submit photos, vote, and appear on leaderboards.\n\n'
                  'Content you submit to a challenge (such as photos, nickname, and scores) may be visible to other users as part of voting, rankings, and related features. Do not submit content you do not have the right to share or that violates others\' rights.\n\n'
                  'You are responsible for the content you upload. If you want submitted content removed, contact us using the details below.',
            ),
            const _PrivacySection(
              title: '7. NOTIFICATIONS',
              icon: Icons.notifications_none,
              content:
                  'Pozal may ask for notification permission to send reminders about weekly challenges, app updates, or relevant feature notifications. Notifications are optional and can be disabled from your device settings.',
            ),
            const _PrivacySection(
              title: '8. MOTION SENSOR',
              icon: Icons.screen_rotation_outlined,
              content:
                  'Pozal uses motion sensor data only to detect a shake gesture that switches the app theme. This data is processed on your device and is not used to identify you.',
            ),
            const _PrivacySection(
              title: '9. LOCAL STORAGE',
              icon: Icons.storage_outlined,
              content:
                  'Some data, such as theme and language preferences, favorites, captured shots, and app state, may be stored locally on your device to improve your experience. You can clear this data from your device or system app settings.',
            ),
            const _PrivacySection(
              title: '10. DATA SECURITY',
              icon: Icons.security,
              content:
                  'We take reasonable technical and administrative measures to protect your data. However, no method of electronic transmission or storage is completely secure. We recommend keeping your device, operating system, and app version up to date.',
            ),
            const _PrivacySection(
              title: '11. CHILDREN\'S PRIVACY',
              icon: Icons.child_care,
              content:
                  'Pozal is not specifically directed to children under 13. We do not knowingly collect personal data from children under 13 without appropriate consent. If you believe a child has provided personal data to us, please contact us so we can review and delete it where required.',
            ),
            const _PrivacySection(
              title: '12. CHANGES TO THIS POLICY',
              icon: Icons.update,
              content:
                  'We may update this Privacy Policy from time to time. When we make material changes, we may notify you in the app or by updating this page. Please review the latest version regularly.',
            ),
            const _PrivacySection(
              title: '13. DATA DELETION AND REQUESTS',
              icon: Icons.delete_forever,
              content:
                  'You can delete locally stored app data from your device settings. For account deletion, uploaded content removal, privacy requests, or questions about data processed by the developer, contact us using the email address below.\n\n'
                  'Some data may need to be retained where required by law, security, fraud prevention, or legitimate operational needs.',
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: CustomColor.bgLight1.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: CustomColor.blueSecondary.withValues(alpha: 0.3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.contact_mail, color: CustomColor.bluePrimary),
                      SizedBox(width: 10),
                      Text(
                        '14. CONTACT',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.whitePrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'For privacy-related questions:',
                    style: TextStyle(
                      fontSize: 14,
                      color: CustomColor.whiteSecondary,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Email: ',
                        style: TextStyle(
                          color: CustomColor.bluePrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          kSupportEmail,
                          style: const TextStyle(
                            color: CustomColor.whitePrimary,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _PrivacySection extends StatelessWidget {
  const _PrivacySection({
    required this.title,
    required this.content,
    required this.icon,
  });

  final String title;
  final String content;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: CustomColor.bgLight1,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: CustomColor.bluePrimary, size: 22),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.whitePrimary,
                  ),
                ),
              ),
            ],
          ),
          const Divider(color: CustomColor.bgLight2, height: 24),
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              color: CustomColor.whiteSecondary,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
