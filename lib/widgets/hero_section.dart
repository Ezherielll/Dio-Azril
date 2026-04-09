import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/constants.dart';
import '../core/theme.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onPortfolioTap;
  final VoidCallback onContactTap;

  const HeroSection({
    super.key,
    required this.onPortfolioTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 900;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 100),
      height: MediaQuery.of(context).size.height,
      child: isMobile
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildContent(context, true),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _buildContent(context, false),
            ),
    );
  }

  List<Widget> _buildContent(BuildContext context, bool isMobile) {
    final textContent = Expanded(
      flex: isMobile ? 0 : 3,
      child: Column(
        crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "HELLO, I'M",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkAccent,
                ),
          ).animate().fadeIn(duration: 500.ms).slideX(begin: -0.2),
          const SizedBox(height: 10),
          Text(
            AppConstants.name,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: isMobile ? 56 : 80,
                  height: 1.1,
                  fontWeight: FontWeight.w900,
                ),
          ).animate().fadeIn(delay: 200.ms, duration: 500.ms).slideX(begin: -0.2),
          const SizedBox(height: 15),
          Text(
            AppConstants.tagline,
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontSize: isMobile ? 20 : 32,
                  fontWeight: FontWeight.w300,
                  color: AppTheme.darkTextMuted,
                ),
          ).animate().fadeIn(delay: 400.ms, duration: 500.ms).slideX(begin: -0.2),
          const SizedBox(height: 50),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
            children: [
              _buildCTAButton(
                context,
                "Lihat Portofolio",
                onPortfolioTap,
                isPrimary: true,
              ),
              _buildCTAButton(
                context,
                "Hubungi Saya",
                onContactTap,
                isPrimary: false,
              ),
            ],
          ).animate().fadeIn(delay: 600.ms, duration: 500.ms).slideY(begin: 0.2),
        ],
      ),
    );

    final imageContent = Expanded(
      flex: isMobile ? 0 : 2,
      child: Center(
        child: Container(
          width: isMobile ? 280 : 400,
          height: isMobile ? 280 : 400,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppTheme.darkAccent.withOpacity(0.5), width: 4),
            image: const DecorationImage(
              image: AssetImage(AppConstants.profileImageUrl),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: AppTheme.darkAccent.withOpacity(0.15),
                blurRadius: 60,
                spreadRadius: 20,
              ),
            ],
          ),
        )
            .animate(onPlay: (controller) => controller.repeat(reverse: true))
            .moveY(begin: -10, end: 10, duration: 2.seconds, curve: Curves.easeInOut)
            .animate() // Intro animation
            .fadeIn(delay: 800.ms, duration: 800.ms)
            .scale(begin: const Offset(0.8, 0.8)),
      ),
    );

    return isMobile ? [imageContent, const SizedBox(height: 60), textContent] : [textContent, imageContent];
  }

  Widget _buildCTAButton(BuildContext context, String label, VoidCallback onTap, {required bool isPrimary}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        decoration: BoxDecoration(
          color: isPrimary ? AppTheme.darkAccent : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: isPrimary ? null : Border.all(color: AppTheme.darkAccent, width: 2),
          boxShadow: [
            if (isPrimary)
              BoxShadow(
                color: AppTheme.darkAccent.withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
          ],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: isPrimary ? Colors.black : AppTheme.darkTextPrimary,
          ),
        ),
      ),
    );
  }
}
