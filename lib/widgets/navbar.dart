import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../core/theme.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  final Function(int) onNavItemTap;

  const Navbar({super.key, required this.onNavItemTap});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 800;

    return AppBar(
      toolbarHeight: 80,
      backgroundColor: AppTheme.darkBackground.withOpacity(0.8),
      surfaceTintColor: Colors.transparent,
      title: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          AppConstants.name.toUpperCase(),
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                letterSpacing: 4,
                fontSize: 22,
                color: AppTheme.darkAccent,
              ),
        ),
      ),
      actions: isMobile
          ? [
              IconButton(
                icon: const Icon(Icons.menu, color: AppTheme.darkAccent),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
              const SizedBox(width: 10),
            ]
          : [
              ...AppConstants.navItems.asMap().entries.map((entry) {
                return _NavBarItem(
                  title: entry.value,
                  onTap: () => onNavItemTap(entry.key),
                );
              }),
              const SizedBox(width: 40),
            ],
    );
  }
}

class _NavBarItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _NavBarItem({required this.title, required this.onTap});

  @override
  State<_NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<_NavBarItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: TextButton(
        onPressed: widget.onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: _isHovered ? AppTheme.darkAccent : AppTheme.darkTextPrimary,
                  ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 2,
              width: _isHovered ? 20 : 0,
              color: AppTheme.darkAccent,
              margin: const EdgeInsets.only(top: 4),
            ),
          ],
        ),
      ),
    );
  }
}

class MobileDrawer extends StatelessWidget {
  final Function(int) onNavItemTap;

  const MobileDrawer({super.key, required this.onNavItemTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.darkSurface,
      child: Column(
        children: [
          const SizedBox(height: 50),
          Text(
            AppConstants.name.toUpperCase(),
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  letterSpacing: 4,
                  fontSize: 24,
                  color: AppTheme.darkAccent,
                ),
          ),
          const SizedBox(height: 30),
          const Divider(color: Colors.white10),
          ...AppConstants.navItems.asMap().entries.map((entry) {
            return ListTile(
              title: Text(
                entry.value,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      letterSpacing: 2,
                    ),
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
