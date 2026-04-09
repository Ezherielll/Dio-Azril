import '../models/experience.dart';
import '../models/project.dart';

class AppConstants {
  static const String name = "Azril";
  static const String tagline = "Flutter Developer | Creative Thinker";
  
  static const List<String> navItems = [
    "Home",
    "About",
    "Experience",
    "Portfolio",
    "Contact",
  ];

  static const String bio = """
Halo! Saya Azril, seorang developer aplikasi yang berfokus pada ekosistem Flutter. Saya senang membangun antarmuka yang intuitif, performan, dan memiliki estetika premium.

Selain Flutter, saya juga memiliki minat mendalam di bidang Machine Learning dan Python, memungkinkan saya untuk mengintegrasikan solusi cerdas ke dalam aplikasi modern. Saya percaya bahwa setiap baris kode harus memberikan nilai nyata bagi pengguna.
""";

  static const List<String> skills = [
    "Flutter",
    "Dart",
    "Firebase",
    "Git",
    "UI/UX Design",
    "Kotlin",
    "Python",
    "Machine Learning",
    "Data Exploration",
  ];

  static const String profileImageUrl = "assets/images/profile.png";
  static const String githubUrl = "https://github.com/Ezherielll";
  static const String linkedinUrl = "#";
  static const String twitterUrl = "#";

  static const List<Experience> experiences = [
    Experience(
      period: "2024 - Sekarang",
      title: "Junior Flutter Developer",
      company: "TechCorp Indonesia",
      description: "Bertanggung jawab atas pengembangan fitur baru pada aplikasi mobile e-commerce menggunakan Flutter dan optimasi performa UI.",
    ),
    Experience(
      period: "2023 - 2024",
      title: "Flutter Developer Intern",
      company: "StartupInc Digital",
      description: "Membantu tim back-end dalam integrasi API dan membangun dashboard internal perusahaan menggunakan Flutter Web.",
    ),
  ];

  static const List<Project> projects = [
    Project(
      title: "Flodo Todo App",
      description: "Aplikasi manajemen tugas harian yang fokus pada kesederhanaan dan produktivitas dengan fitur cloud sync.",
      imageUrl: "assets/images/todo_app.png",
      techStack: ["Flutter", "Firebase", "Riverpod"],
      githubUrl: "https://github.com/Ezherielll",
    ),
    Project(
      title: "E-Commerce Dashboard",
      description: "Sistem manajemen inventaris dan analitik penjualan real-time untuk platform e-commerce.",
      imageUrl: "assets/images/ecommerce.png",
      techStack: ["Flutter Web", "Charts", "Python"],
      liveUrl: "#",
    ),
    Project(
      title: "ML Sentiment Analysis",
      description: "Integrasi model Machine Learning untuk menganalisis sentimen ulasan pengguna secara otomatis.",
      imageUrl: "assets/images/ml_analysis.png",
      techStack: ["Python", "TensorFlow", "FastAPI"],
      githubUrl: "#",
    ),
  ];
}
