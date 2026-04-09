import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../core/theme.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  final Function(int) onNavItemTap;

  const Navbar({super.key, required this.onNavItemTap});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 700;

    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          AppConstants.name.toUpperCase(),
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                letterSpacing: 4,
                color: AppTheme.darkAccent,
              ),
        ),
      ),
      actions: isMobile
          ? [
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
              const SizedBox(width: 10),
            ]
          : [
              ...AppConstants.navItems.asMap().entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextButton(
                    onPressed: () => onNavItemTap(entry.key),
                    child: Text(
                      entry.value,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                );
              }),
              const SizedBox(width: 20),
            ],
    );
  }
}

class MobileDrawer extends StatelessWidget {
  final Function(int) onNavItemTap;

  const MobileDrawer({super.key, required this.onNavItemTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.darkBackground,
      child: Column(
        children: [
          const SizedBox(height: 50),
          ...AppConstants.navItems.asMap().entries.map((entry) {
            return ListTile(
              title: Text(
                entry.value,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onTap: () {
                onNavItemTap(entry.key);
                Navigator.pop(context);
              },
            );
          }),
        ],
      ),
    );
  }
}
