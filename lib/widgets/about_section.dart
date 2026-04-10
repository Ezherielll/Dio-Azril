import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/constants.dart';
import '../core/theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 800;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 100,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 40),
          if (isMobile)
            Column(
              children: [
                _buildBio(context),
                const SizedBox(height: 40),
                _buildSkills(context),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 3, child: _buildBio(context)),
                const SizedBox(width: 80),
                Expanded(flex: 2, child: _buildSkills(context)),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "ABOUT ME",
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            color: AppTheme.darkAccent,
            letterSpacing: 2,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          height: 4,
          width: 60,
          color: AppTheme.darkAccent,
        ),
      ],
    ).animate().fadeIn().slideX(begin: -0.1);
  }

  Widget _buildBio(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppConstants.bio,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            height: 1.8,
            color: AppTheme.darkTextPrimary.withValues(),
          ),
        ),
      ],
    ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1);
  }

  Widget _buildSkills(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "SKILLS & TECH",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: AppTheme.darkTextMuted,
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: AppConstants.skills
              .map((skill) => _buildSkillChip(context, skill))
              .toList(),
        ),
      ],
    ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.1);
  }

  Widget _buildSkillChip(BuildContext context, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.darkSurface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.darkAccent.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: AppTheme.darkTextPrimary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
