# Dio Azril | Personal Portfolio

A premium, modern, and responsive personal portfolio website built with **Flutter Web**. This project showcases a professional journey, technical skills, and a curated project gallery.

## ✨ Features

- **Premium Aesthetics**: Dark mode by default with a curated color palette and sophisticated typography.
- **Micro-Animations**: Smooth entrance effects and continuous floating animations for a dynamic user experience.
- **Fully Responsive**: Optimized for Mobile, Tablet, and Desktop screen sizes.
- **Experience Timeline**: A vertical history of professional roles and education.
- **Portfolio Grid**: Interactive project cards with hover-to-reveal details and tech stack tags.
- **Contact Form**: Integrated validation and simulated submission logic.
- **Search Engine Optimized (SEO)**: Custom meta tags and Open Graph descriptions for better visibility.
- **Accessibility (A11y)**: Proper `Semantics` tags for screen reader compatibility.
- **Branded Flash Screen**: Custom CSS-based loader during Flutter initialization.

## 🛠️ Tech Stack

- **Framework**: [Flutter Web](https://flutter.dev/multi-platform/web)
- **Styling**: [Google Fonts](https://pub.dev/packages/google_fonts) (Playfair Display & Inter)
- **Animations**: [flutter_animate](https://pub.dev/packages/flutter_animate)
- **Icons**: Material Icons / FontAwesome Icons

## 📂 Project Structure

- `lib/core/`: Application theme, constants, and color palette.
- `lib/widgets/`: Modular UI components (Navbar, Hero, About, Experience, Portfolio, etc.).
- `lib/models/`: Data models for Experience and Project items.
- `assets/`: Optimized images and icons.

## ⚙️ Getting Started

### Prerequisites
- Flutter SDK (Channel Stable)
- Google Chrome or any modern browser

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/Ezherielll/Dio-Azril.git
   ```
2. Navigate to the project directory:
   ```bash
   cd my_personal_web
   ```
3. Get dependencies:
   ```bash
   flutter pub get
   ```
4. Run the application:
   ```bash
   flutter run -d chrome
   ```

### Build for Production
To generate the web release build:
```bash
flutter build web --release --web-renderer canvaskit
```

---
Built with ❤️ by [Dio Azril](https://github.com/Ezherielll)
