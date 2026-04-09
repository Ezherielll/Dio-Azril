import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../core/theme.dart';
import 'project_card.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 700;
    final bool isTablet = width >= 700 && width < 1100;

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
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : (isTablet ? 2 : 3),
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              childAspectRatio: 0.85,
            ),
            itemCount: AppConstants.projects.length,
            itemBuilder: (context, index) {
              return ProjectCard(project: AppConstants.projects[index]);
            },
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
          "MY PORTFOLIO",
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
}
