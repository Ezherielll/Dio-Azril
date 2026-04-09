import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../core/theme.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      color: AppTheme.darkSurface,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "© ${AppConstants.currentYear} ",
                style: const TextStyle(color: AppTheme.darkTextMuted),
              ),
              Text(
                AppConstants.name,
                style: const TextStyle(
                  color: AppTheme.darkAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                ". All rights reserved.",
                style: TextStyle(color: AppTheme.darkTextMuted),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Made with ",
                style: TextStyle(color: AppTheme.darkTextMuted, fontSize: 12),
              ),
              const Icon(Icons.favorite, color: Colors.red, size: 12),
              const Text(
                " and ",
                style: TextStyle(color: AppTheme.darkTextMuted, fontSize: 12),
              ),
              const Text(
                "Flutter",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
