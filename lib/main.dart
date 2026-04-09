import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'widgets/navbar.dart';
import 'widgets/hero_section.dart';
import 'widgets/about_section.dart';

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
            // HERO SECTION
            Container(
              key: _sectionKeys[0],
              child: HeroSection(
                onPortfolioTap: () => _scrollToSection(3), // Index 3 is Portfolio
                onContactTap: () => _scrollToSection(4),   // Index 4 is Contact
              ),
            ),
            
            // ABOUT SECTION
            Container(
              key: _sectionKeys[1],
              child: const AboutSection(),
            ),

            // PLACEHOLDERS FOR REMAINING SECTIONS
            _buildPlaceholderSection(2, "Experience Section Placeholder"),
            _buildPlaceholderSection(3, "Portfolio Section Placeholder"),
            _buildPlaceholderSection(4, "Contact Section Placeholder"),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholderSection(int index, String title) {
    return Container(
      key: _sectionKeys[index],
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      color: Colors.transparent,
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            color: Colors.white24,
          ),
        ),
      ),
    );
  }
}
