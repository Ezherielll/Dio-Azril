import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'core/theme.dart';
import 'widgets/navbar.dart';

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
      theme: AppTheme.darkTheme, // Default to Dark Mode as per PRD
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
            _buildSection(0, "Hero Section Placeholder", Colors.transparent),
            _buildSection(1, "About Section Placeholder", Colors.transparent),
            _buildSection(2, "Experience Section Placeholder", Colors.transparent),
            _buildSection(3, "Portfolio Section Placeholder", Colors.transparent),
            _buildSection(4, "Contact Section Placeholder", Colors.transparent),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(int index, String title, Color color) {
    return Container(
      key: _sectionKeys[index],
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      color: color,
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.displayMedium,
        ).animate().fadeIn(duration: 1.seconds).slideY(begin: 0.2, end: 0),
      ),
    );
  }
}
