import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/project.dart';
import '../core/theme.dart';

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutBack,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: AppTheme.darkSurface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isHovered ? AppTheme.darkAccent : Colors.white10,
              width: 1,
            ),
            boxShadow: [
              if (_isHovered)
                BoxShadow(
                  color: AppTheme.darkAccent.withValues(alpha: 0.15),
                  blurRadius: 30,
                  spreadRadius: 5,
                ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project Image
              Expanded(
                child: Stack(
                  children: [
                    Semantics(
                      label: "Gambar Proyek: ${widget.project.title}",
                      image: true,
                      child: Image.asset(
                        widget.project.imageUrl,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      color: _isHovered ? Colors.black54 : Colors.transparent,
                      child: _isHovered
                          ? Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (widget.project.githubUrl != null)
                                    _buildIconButton(Icons.code, widget.project.githubUrl!, "GitHub"),
                                  if (widget.project.liveUrl != null)
                                    _buildIconButton(Icons.launch, widget.project.liveUrl!, "Live Demo"),
                                ],
                              ),
                            ).animate().fadeIn().scale()
                          : const SizedBox.expand(),
                    ),
                  ],
                ),
              ),
              // Content
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project.title,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: _isHovered ? AppTheme.darkAccent : AppTheme.darkTextPrimary,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.project.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppTheme.darkTextMuted,
                            height: 1.5,
                          ),
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: widget.project.techStack.map((tech) => _buildTechTag(tech)).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.1);
  }

  Widget _buildIconButton(IconData icon, String url, String label) {
    return Semantics(
      button: true,
      label: "Buka $label Proyek",
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: AppTheme.darkAccent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: IconButton(
          icon: Icon(icon, color: Colors.black, size: 24),
          onPressed: () {},
        ),
      ).animate().fadeIn(duration: 200.ms).scale(),
    );
  }

  Widget _buildTechTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.darkBackground,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppTheme.darkAccent.withValues(alpha: 0.2)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: AppTheme.darkAccent,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
