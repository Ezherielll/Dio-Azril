import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'widgets/navbar.dart';
import 'widgets/hero_section.dart';
import 'widgets/about_section.dart';
import 'widgets/experience_section.dart';
import 'widgets/portfolio_section.dart';
import 'widgets/contact_section.dart';
import 'widgets/footer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Azril | Personal Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  
  // Section keys for scrolling
  final List<GlobalKey> _sectionKeys = List.generate(5, (index) => GlobalKey());

  void _scrollToSection(int index) {
    final context = _sectionKeys[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutQuart,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(onNavItemTap: _scrollToSection),
      endDrawer: MobileDrawer(onNavItemTap: _scrollToSection),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // HERO SECTION (Index 0)
            Container(
              key: _sectionKeys[0],
              child: HeroSection(
                onPortfolioTap: () => _scrollToSection(3), // Index 3 is Portfolio
                onContactTap: () => _scrollToSection(4),   // Index 4 is Contact
              ),
            ),
            
            // ABOUT SECTION (Index 1)
            Container(
              key: _sectionKeys[1],
              child: const AboutSection(),
            ),

            // EXPERIENCE SECTION (Index 2)
            Container(
              key: _sectionKeys[2],
              child: const ExperienceSection(),
            ),

            // PORTFOLIO SECTION (Index 3)
            Container(
              key: _sectionKeys[3],
              child: const PortfolioSection(),
            ),

            // CONTACT SECTION (Index 4)
            Container(
              key: _sectionKeys[4],
              child: const ContactSection(),
            ),

            // FOOTER
            const Footer(),
          ],
        ),
      ),
    );
  }
}
