import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/constants.dart';
import '../core/theme.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: AppTheme.darkSurface,
          title: Text(
            "Pesan Terkirim!",
            style: Theme.of(
              context,
            ).textTheme.displaySmall?.copyWith(fontSize: 24),
          ),
          content: Text(
            "Terima kasih telah menghubungi saya, ${_nameController.text}. Saya akan merespons sesegera mungkin.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _nameController.clear();
                _emailController.clear();
                _messageController.clear();
              },
              child: const Text(
                "OK",
                style: TextStyle(color: AppTheme.darkAccent),
              ),
            ),
          ],
        ),
      );
    }
  }

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
          isMobile
              ? Column(
                  children: [
                    _buildForm(context),
                    const SizedBox(height: 60),
                    _buildSocialInfo(context),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: _buildForm(context)),
                    const SizedBox(width: 100),
                    Expanded(flex: 2, child: _buildSocialInfo(context)),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Semantics(
      header: true,
      label: "Seksi Hubungi Saya",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "GET IN TOUCH",
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
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildTextField(
            context,
            controller: _nameController,
            label: "Nama",
            validator: (v) =>
                v?.isEmpty ?? true ? "Nama tidak boleh kosong" : null,
          ),
          const SizedBox(height: 20),
          _buildTextField(
            context,
            controller: _emailController,
            label: "Email",
            validator: (v) => ((v?.isEmpty ?? true) || !v!.contains('@'))
                ? "Email tidak valid"
                : null,
          ),
          const SizedBox(height: 20),
          _buildTextField(
            context,
            controller: _messageController,
            label: "Pesan",
            maxLines: 5,
            validator: (v) =>
                v?.isEmpty ?? true ? "Pesan tidak boleh kosong" : null,
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: Semantics(
              button: true,
              label: "Kirim Pesan Sekarang",
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.darkAccent,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "KIRIM PESAN",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.1);
  }

  Widget _buildTextField(
    BuildContext context, {
    required TextEditingController controller,
    required String label,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      style: const TextStyle(color: AppTheme.darkTextPrimary),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: AppTheme.darkTextMuted),
        filled: true,
        fillColor: AppTheme.darkSurface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppTheme.darkAccent.withValues(alpha: 0.1),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppTheme.darkAccent),
        ),
        errorStyle: const TextStyle(color: Colors.redAccent),
      ),
    );
  }

  Widget _buildSocialInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "HUBUNGI SAYA DI",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: AppTheme.darkTextMuted,
          ),
        ),
        const SizedBox(height: 30),
        _buildSocialItem(
          context,
          "Email",
          AppConstants.contactEmail,
          Icons.email_outlined,
        ),
        _buildSocialItem(context, "GitHub", "Ezherielll", Icons.code_rounded),
        _buildSocialItem(
          context,
          "LinkedIn",
          "Your Name",
          Icons.business_center_outlined,
        ),
        const SizedBox(height: 40),
        Row(
          children: [
            _buildSocialIcon(Icons.discord),
            const SizedBox(width: 15),
            _buildSocialIcon(Icons.telegram),
            const SizedBox(width: 15),
            _buildSocialIcon(Icons.facebook),
          ],
        ),
      ],
    ).animate().fadeIn(delay: 200.ms).slideX(begin: 0.1);
  }

  Widget _buildSocialItem(
    BuildContext context,
    String title,
    String value,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.darkAccent, size: 28),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppTheme.darkTextMuted,
                  fontSize: 12,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  color: AppTheme.darkTextPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Semantics(
      button: true,
      label: "Ikon Sosial",
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppTheme.darkSurface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppTheme.darkAccent.withValues(alpha: 0.2)),
        ),
        child: Icon(icon, color: AppTheme.darkAccent, size: 20),
      ),
    );
  }
}
