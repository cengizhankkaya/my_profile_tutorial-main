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
    final isSmallScreen = screenWidth < 400;
    final isMobile = screenWidth < 600;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Container(
          width: screenWidth,
          padding: EdgeInsets.fromLTRB(
            isSmallScreen ? 20 : 25, 
            20, 
            isSmallScreen ? 20 : 25, 
            60
          ),
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
                          height: isSmallScreen ? 32 : 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                CustomColor.bluePrimary,
                                CustomColor.bluePrimary.withOpacity(0.3),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        SizedBox(width: isSmallScreen ? 12 : 15),
                        Text(
                          "Özgeçmiş",
                          style: TextStyle(
                            fontSize: isSmallScreen ? 22 : isMobile ? 24 : 28,
                            fontWeight: FontWeight.bold,
                            color: CustomColor.whitePrimary,
                            letterSpacing: isSmallScreen ? 0.8 : 1.2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: isSmallScreen ? 30 : 50),
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
                
                SizedBox(height: isSmallScreen ? 30 : 40),
                
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
                    SizedBox(height: isSmallScreen ? 16 : 20),
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
                
                SizedBox(height: isSmallScreen ? 30 : 40),
                
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
                    SizedBox(height: isSmallScreen ? 12 : 15),
                    _buildCertificateItem(
                      name: "SQL Öğrenme",
                      issuer: "Ömer Çolakoğlu Udemy Kursu",
                      date: "",
                      index: 1,
                    ),
                    SizedBox(height: isSmallScreen ? 12 : 15),
                    _buildCertificateItem(
                      name: "MySQL Eğitimi",
                      issuer: "Microsoft MVP – Ömer Çolakoğlu",
                      date: "",
                      index: 2,
                    ),
                  ],
                ),
                
                SizedBox(height: isSmallScreen ? 30 : 40),
                
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
                    SizedBox(height: isSmallScreen ? 12 : 15),
                    _buildLanguageItem(
                      language: "İngilizce",
                      level: "Başlangıç Seviyesi",
                      index: 1,
                    ),
                    SizedBox(height: isSmallScreen ? 12 : 15),
                    _buildLanguageItem(
                      language: "Almanca",
                      level: "Başlangıç Seviyesi",
                      index: 2,
                    ),
                  ],
                ),
                
                SizedBox(height: isSmallScreen ? 30 : 40),
                
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
                    SizedBox(height: isSmallScreen ? 16 : 20),
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;
    final isMobile = screenWidth < 600;
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
              margin: EdgeInsets.symmetric(vertical: isSmallScreen ? 12 : 16),
              padding: EdgeInsets.all(isSmallScreen ? 16 : isMobile ? 20 : 24),
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
                        padding: EdgeInsets.all(isSmallScreen ? 8 : 10),
                        decoration: BoxDecoration(
                          color: CustomColor.bluePrimary.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          icon,
                          color: CustomColor.bluePrimary,
                          size: isSmallScreen ? 22 : isMobile ? 24 : 28,
                        ),
                      ),
                      SizedBox(width: isSmallScreen ? 12 : 16),
                      Flexible(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: isSmallScreen ? 18 : isMobile ? 20 : 24,
                            fontWeight: FontWeight.w700,
                            color: CustomColor.whitePrimary,
                            letterSpacing: isSmallScreen ? 0.3 : 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: isSmallScreen ? 16 : 24),
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;
    final isMobile = screenWidth < 600;
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
              padding: EdgeInsets.all(isSmallScreen ? 14 : isMobile ? 16 : 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: CustomColor.bgLight1,
                border: Border.all(
                  color: CustomColor.blueSecondary.withOpacity(0.4),
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
                          style: TextStyle(
                            fontSize: isSmallScreen ? 16 : isMobile ? 17 : 18,
                            fontWeight: FontWeight.w700,
                            color: CustomColor.whitePrimary,
                          ),
                        ),
                      ),
                      SizedBox(width: isSmallScreen ? 8 : 12),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: isSmallScreen ? 8 : 12,
                            vertical: isSmallScreen ? 5 : 6,
                          ),
                          decoration: BoxDecoration(
                            color: CustomColor.bgLight1.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: CustomColor.blueSecondary.withOpacity(0.4),
                            ),
                          ),
                          child: Text(
                            period,
                            style: TextStyle(
                              fontSize: isSmallScreen ? 11 : 13,
                              color: CustomColor.whiteSecondary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (school.isNotEmpty) ...[
                    SizedBox(height: isSmallScreen ? 8 : 12),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: isSmallScreen ? 14 : 16,
                          color: CustomColor.whiteSecondary,
                        ),
                        SizedBox(width: isSmallScreen ? 4 : 6),
                        Expanded(
                          child: Text(
                            school,
                            style: TextStyle(
                              fontSize: isSmallScreen ? 13 : 15,
                              color: CustomColor.whiteSecondary,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                  if (description.isNotEmpty) ...[
                    SizedBox(height: isSmallScreen ? 6 : 8),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: isSmallScreen ? 12 : 14,
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;
    final isMobile = screenWidth < 600;
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
              padding: EdgeInsets.all(isSmallScreen ? 14 : isMobile ? 16 : 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: CustomColor.bgLight1,
                border: Border.all(
                  color: CustomColor.blueSecondary.withOpacity(0.4),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Pozisyon başlığı
                  Text(
                    position,
                    style: TextStyle(
                      fontSize: isSmallScreen ? 16 : isMobile ? 17 : 18,
                      fontWeight: FontWeight.w700,
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                  SizedBox(height: isSmallScreen ? 8 : 10),
                  // Şirket adı
                  Row(
                    children: [
                      Icon(
                        Icons.business,
                        size: isSmallScreen ? 14 : 16,
                        color: CustomColor.bluePrimary,
                      ),
                      SizedBox(width: isSmallScreen ? 4 : 6),
                      Expanded(
                        child: Text(
                          company,
                          style: TextStyle(
                            fontSize: isSmallScreen ? 13 : 15,
                            color: CustomColor.bluePrimary,
                            fontWeight: FontWeight.w500,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: isSmallScreen ? 10 : 12),
                  // Tarih etiketi - mobilde alt satırda
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isSmallScreen ? 10 : 12,
                        vertical: isSmallScreen ? 6 : 7,
                      ),
                      decoration: BoxDecoration(
                        color: CustomColor.bgLight1.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: CustomColor.blueSecondary.withOpacity(0.4),
                        ),
                      ),
                      child: Text(
                        period,
                        style: TextStyle(
                          fontSize: isSmallScreen ? 11 : 13,
                          color: CustomColor.whiteSecondary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: isSmallScreen ? 12 : 16),
                  // Açıklama
                  Container(
                    padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: CustomColor.bgLight1.withOpacity(0.5),
                    ),
                    child: Text(
                      description,
                      style: TextStyle(
                        fontSize: isSmallScreen ? 12 : 14,
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;
    final isMobile = screenWidth < 600;
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
              padding: EdgeInsets.all(isSmallScreen ? 14 : isMobile ? 16 : 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: CustomColor.bgLight1,
                border: Border.all(
                  color: CustomColor.blueSecondary.withOpacity(0.4),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(isSmallScreen ? 6 : 8),
                        decoration: BoxDecoration(
                          color: CustomColor.bluePrimary.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.verified,
                          size: isSmallScreen ? 18 : 20,
                          color: CustomColor.bluePrimary,
                        ),
                      ),
                      SizedBox(width: isSmallScreen ? 10 : 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                fontSize: isSmallScreen ? 13 : 15,
                                fontWeight: FontWeight.w600,
                                color: CustomColor.whitePrimary,
                              ),
                            ),
                            SizedBox(height: isSmallScreen ? 3 : 4),
                            Text(
                              issuer,
                              style: TextStyle(
                                fontSize: isSmallScreen ? 11 : 13,
                                color: CustomColor.whiteSecondary,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (date.isNotEmpty) ...[
                    SizedBox(height: isSmallScreen ? 8 : 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: isSmallScreen ? 8 : 10,
                          vertical: isSmallScreen ? 4 : 5,
                        ),
                        decoration: BoxDecoration(
                          color: CustomColor.bgLight1.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: CustomColor.blueSecondary.withOpacity(0.4),
                          ),
                        ),
                        child: Text(
                          date,
                          style: TextStyle(
                            fontSize: isSmallScreen ? 11 : 13,
                            color: CustomColor.whiteSecondary,
                          ),
                        ),
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

  Widget _buildLanguageItem({
    required String language,
    required String level,
    required int index,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;
    final isMobile = screenWidth < 600;
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
              padding: EdgeInsets.symmetric(
                horizontal: isSmallScreen ? 14 : isMobile ? 16 : 18,
                vertical: isSmallScreen ? 12 : 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: CustomColor.bgLight1,
                border: Border.all(
                  color: CustomColor.blueSecondary.withOpacity(0.4),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(isSmallScreen ? 6 : 8),
                        decoration: BoxDecoration(
                          color: CustomColor.bluePrimary.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.language,
                          size: isSmallScreen ? 18 : 20,
                          color: CustomColor.bluePrimary,
                        ),
                      ),
                      SizedBox(width: isSmallScreen ? 10 : 12),
                      Text(
                        language,
                        style: TextStyle(
                          fontSize: isSmallScreen ? 14 : 16,
                          fontWeight: FontWeight.w600,
                          color: CustomColor.whitePrimary,
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isSmallScreen ? 8 : 12,
                        vertical: isSmallScreen ? 5 : 6,
                      ),
                      decoration: BoxDecoration(
                        color: CustomColor.bgLight1.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: CustomColor.blueSecondary.withOpacity(0.4),
                        ),
                      ),
                      child: Text(
                        level,
                        style: TextStyle(
                          fontSize: isSmallScreen ? 11 : 13,
                          color: CustomColor.whiteSecondary,
                        ),
                        textAlign: TextAlign.center,
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;
    final isMobile = screenWidth < 600;
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
              margin: EdgeInsets.only(bottom: isSmallScreen ? 12 : 16),
              padding: EdgeInsets.all(isSmallScreen ? 14 : isMobile ? 16 : 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: CustomColor.bgLight1,
                border: Border.all(
                  color: CustomColor.blueSecondary.withOpacity(0.4),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: isSmallScreen ? 15 : 17,
                      fontWeight: FontWeight.w700,
                      color: CustomColor.bluePrimary,
                    ),
                  ),
                  SizedBox(height: isSmallScreen ? 12 : 16),
                  Wrap(
                    spacing: isSmallScreen ? 8 : 10,
                    runSpacing: isSmallScreen ? 8 : 10,
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
                                padding: EdgeInsets.symmetric(
                                  horizontal: isSmallScreen ? 12 : 14,
                                  vertical: isSmallScreen ? 6 : 8,
                                ),
                                decoration: BoxDecoration(
                                  color: CustomColor.bgLight1.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: CustomColor.blueSecondary.withOpacity(0.4),
                                  ),
                                ),
                                child: Text(
                                  skill,
                                  style: TextStyle(
                                    fontSize: isSmallScreen ? 11 : 13,
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

