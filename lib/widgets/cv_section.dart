import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/size.dart';

class CvSection extends StatefulWidget {
  const CvSection({super.key});

  @override
  State<CvSection> createState() => _CvSectionState();
}

class _CvSectionState extends State<CvSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOutCubic),
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= kMinDesktopWidth;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Container(
          width: screenWidth,
          padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
          decoration: BoxDecoration(
            color: CustomColor.bgLight1,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                CustomColor.bgLight1,
                CustomColor.bgLight1.withOpacity(0.8),
              ],
            ),
          ),
          child: Column(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 4,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                CustomColor.yellowPrimary,
                                CustomColor.yellowPrimary.withOpacity(0.3),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Text(
                          "Özgeçmiş",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: CustomColor.whitePrimary,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                // Eğitim Bölümü
                _buildSection(
                  title: "Eğitim",
                  icon: Icons.school,
                  delay: 100,
                  children: [
                    _buildEducationItem(
                      degree: "Bilgisayar Mühendisliği",
                      school: "Nevşehir Hacı Bektaş Veli Üniversitesi",
                      period: "2021 - 2025",
                      description: "Lisans",
                      index: 0,
                    ),
                    const SizedBox(height: 20),
                    _buildEducationItem(
                      degree: "Cumhuriyet Mesleki ve Teknik Anadolu Lisesi",
                      school: "",
                      period: "2015 - 2019",
                      description: "",
                      index: 1,
                    ),
                  ],
                ),
                
                const SizedBox(height: 40),
                
                // İş Deneyimi Bölümü
                _buildSection(
                  title: "İş Deneyimi",
                  icon: Icons.work,
                  delay: 200,
                  children: [
                    _buildExperienceItem(
                      position: "AI Stajyer",
                      company: "Ceka Yazılım Ar-Ge Mühendislik ve Bilgisayar Elektroniği Ltd. ŞF.",
                      period: "07/07/2025 – 18/08/2025",
                      description: "Yapay Zekâ ekibinde staj sırasında makine öğrenimi modelleri geliştirdim, veri ön işleme ve model eğitim süreçlerine katıldım; mobil uygulamalar için TensorFlow entegrasyonu yaptım.",
                      isDesktop: isDesktop,
                      index: 0,
                    ),
                    const SizedBox(height: 20),
                    _buildExperienceItem(
                      position: "Mobil Uygulama Geliştirme Stajyeri (Flutter)",
                      company: "Ege Serbest Bölge Kuruluş ve İşletme A.Ş",
                      period: "08/07/2024 – 19/08/2024",
                      description: "Bir proximity kart okuyucusunu MSSQL veritabanı ile entegre eden bir backend API geliştirdim. ASP.NET Core Web API ve Entity Framework Core kullanılarak inşa edildi. API, etkinlik yönetimi fonksiyonları sağlıyor. Hem Flutter hem de React uygulamalarını destekleyecek şekilde tasarlandı. Flutter geliştirmede mimari tasarım desenleri kullanıldı. Figma prototipleri baz alınarak UI/UX tasarımları uygulandı.",
                      isDesktop: isDesktop,
                      index: 1,
                    ),
                  ],
                ),
                
                const SizedBox(height: 40),
                
                // Sertifikalar / Etkinlikler Bölümü
                _buildSection(
                  title: "Sosyal / Akademik Etkinlikler",
                  icon: Icons.verified,
                  delay: 300,
                  children: [
                    _buildCertificateItem(
                      name: "Teknofest 2022 Roket Yarışması – Orta İrtifa Kategorisi",
                      issuer: "6.'lık",
                      date: "2022",
                      index: 0,
                    ),
                    const SizedBox(height: 15),
                    _buildCertificateItem(
                      name: "SQL Öğrenme",
                      issuer: "Ömer Çolakoğlu Udemy Kursu",
                      date: "",
                      index: 1,
                    ),
                    const SizedBox(height: 15),
                    _buildCertificateItem(
                      name: "MySQL Eğitimi",
                      issuer: "Microsoft MVP – Ömer Çolakoğlu",
                      date: "",
                      index: 2,
                    ),
                  ],
                ),
                
                const SizedBox(height: 40),
                
                // Diller Bölümü
                _buildSection(
                  title: "Diller",
                  icon: Icons.language,
                  delay: 400,
                  children: [
                    _buildLanguageItem(
                      language: "Türkçe",
                      level: "Ana Dil",
                      index: 0,
                    ),
                    const SizedBox(height: 15),
                    _buildLanguageItem(
                      language: "İngilizce",
                      level: "Başlangıç Seviyesi",
                      index: 1,
                    ),
                    const SizedBox(height: 15),
                    _buildLanguageItem(
                      language: "Almanca",
                      level: "Başlangıç Seviyesi",
                      index: 2,
                    ),
                  ],
                ),
                
                const SizedBox(height: 40),
                
                // Yetenekler Bölümü
                _buildSection(
                  title: "Yetenekler",
                  icon: Icons.code,
                  delay: 500,
                  children: [
                    _buildSkillsCategory(
                      title: "Teknik Beceriler",
                      skills: [
                        "StateManagement (Provider, Bloc)",
                        "Flutter, Dart",
                        "Testing (Unit, Widget, Integration, Patrol)",
                        "Firebase",
                        "MVVM ve Temiz Mimari",
                        "Duyarlı (Responsive) Arayüz Tasarımı",
                        "Git & GitHub",
                        "Python",
                        "TensorFlow Lite",
                        "SQL",
                        "Swift (Beginner)",
                      ],
                    ),
                    const SizedBox(height: 20),
                    _buildSkillsCategory(
                      title: "Yazılımlar ve Araçlar",
                      skills: [
                        "Figma",
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required List<Widget> children,
    int delay = 0,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 800 + delay),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 30 * (1 - value)),
            child: Container(
              width: double.infinity,
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
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: CustomColor.yellowPrimary.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          icon,
                          color: CustomColor.yellowPrimary,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: CustomColor.whitePrimary,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ...children,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildEducationItem({
    required String degree,
    required String school,
    required String period,
    required String description,
    required int index,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 600 + (index * 100)),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(20 * (1 - value), 0),
            child: Container(
              margin: EdgeInsets.only(bottom: index == 0 ? 16 : 0),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: CustomColor.bgLight1,
                border: Border.all(
                  color: CustomColor.yellowSecondary.withOpacity(0.4),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          degree,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: CustomColor.whitePrimary,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: CustomColor.bgLight1.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: CustomColor.yellowSecondary.withOpacity(0.4),
                          ),
                        ),
                        child: Text(
                          period,
                          style: const TextStyle(
                            fontSize: 13,
                            color: CustomColor.whiteSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (school.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 16,
                          color: CustomColor.whiteSecondary,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            school,
                            style: const TextStyle(
                              fontSize: 15,
                              color: CustomColor.whiteSecondary,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                  if (description.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: CustomColor.hintDark,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildExperienceItem({
    required String position,
    required String company,
    required String period,
    required String description,
    required bool isDesktop,
    required int index,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 700 + (index * 100)),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(20 * (1 - value), 0),
            child: Container(
              margin: EdgeInsets.only(bottom: index == 0 ? 16 : 0),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: CustomColor.bgLight1,
                border: Border.all(
                  color: CustomColor.yellowSecondary.withOpacity(0.4),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              position,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: CustomColor.whitePrimary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.business,
                                  size: 16,
                                  color: CustomColor.yellowPrimary,
                                ),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    company,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: CustomColor.yellowPrimary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: CustomColor.bgLight1.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: CustomColor.yellowSecondary.withOpacity(0.4),
                          ),
                        ),
                        child: Text(
                          period,
                          style: const TextStyle(
                            fontSize: 13,
                            color: CustomColor.whiteSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: CustomColor.bgLight1.withOpacity(0.5),
                    ),
                    child: Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: CustomColor.whiteSecondary,
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCertificateItem({
    required String name,
    required String issuer,
    required String date,
    required int index,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 500 + (index * 80)),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(15 * (1 - value), 0),
            child: Container(
              margin: EdgeInsets.only(bottom: index < 2 ? 12 : 0),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: CustomColor.bgLight1,
                border: Border.all(
                  color: CustomColor.yellowSecondary.withOpacity(0.4),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: CustomColor.yellowPrimary.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.verified,
                            size: 20,
                            color: CustomColor.yellowPrimary,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: CustomColor.whitePrimary,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                issuer,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: CustomColor.whiteSecondary,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (date.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: CustomColor.bgLight1.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: CustomColor.yellowSecondary.withOpacity(0.4),
                        ),
                      ),
                      child: Text(
                        date,
                        style: const TextStyle(
                          fontSize: 13,
                          color: CustomColor.whiteSecondary,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLanguageItem({
    required String language,
    required String level,
    required int index,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 500 + (index * 80)),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(15 * (1 - value), 0),
            child: Container(
              margin: EdgeInsets.only(bottom: index < 2 ? 12 : 0),
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: CustomColor.bgLight1,
                border: Border.all(
                  color: CustomColor.yellowSecondary.withOpacity(0.4),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: CustomColor.yellowPrimary.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.language,
                          size: 20,
                          color: CustomColor.yellowPrimary,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        language,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: CustomColor.whitePrimary,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: CustomColor.bgLight1.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: CustomColor.yellowSecondary.withOpacity(0.4),
                      ),
                    ),
                    child: Text(
                      level,
                      style: const TextStyle(
                        fontSize: 13,
                        color: CustomColor.whiteSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSkillsCategory({
    required String title,
    required List<String> skills,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - value)),
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: CustomColor.bgLight1,
                border: Border.all(
                  color: CustomColor.yellowSecondary.withOpacity(0.4),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: CustomColor.yellowPrimary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: skills.asMap().entries.map((entry) {
                      final index = entry.key;
                      final skill = entry.value;
                      return TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0.0, end: 1.0),
                        duration: Duration(milliseconds: 400 + (index * 50)),
                        curve: Curves.easeOutBack,
                        builder: (context, skillValue, child) {
                          return Transform.scale(
                            scale: skillValue,
                            child: Opacity(
                              opacity: skillValue,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: CustomColor.bgLight1.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: CustomColor.yellowSecondary.withOpacity(0.4),
                                  ),
                                ),
                                child: Text(
                                  skill,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: CustomColor.whiteSecondary,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

