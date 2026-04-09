class Project {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> techStack;
  final String? githubUrl;
  final String? liveUrl;

  const Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.techStack,
    this.githubUrl,
    this.liveUrl,
  });
}
