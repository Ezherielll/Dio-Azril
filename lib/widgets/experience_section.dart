import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../core/theme.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

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
          const SizedBox(height: 60),
          ...AppConstants.experiences.map((exp) => _buildExperienceItem(context, exp)),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "MY EXPERIENCE",
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
    );
  }

  Widget _buildExperienceItem(BuildContext context, dynamic exp) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline Column
            Column(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: AppTheme.darkAccent,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.darkAccent.withOpacity(0.5),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 2,
                    color: AppTheme.darkAccent.withOpacity(0.3),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 30),
            // Content Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exp.period,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppTheme.darkAccent,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    exp.title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                  ),
                  Text(
                    exp.company,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.darkTextMuted,
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    exp.description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          height: 1.6,
                          color: AppTheme.darkTextPrimary.withOpacity(0.7),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
