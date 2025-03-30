import 'package:expense_tracker/app/routing/app_navigator.dart';
import 'package:flutter/material.dart';

class LanguageSelectionPage extends StatefulWidget {
  const LanguageSelectionPage({Key? key}) : super(key: key);

  @override
  State<LanguageSelectionPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  // This would be fetched from your localization setup
  String _selectedLanguage = 'English';

  void _changeLanguage(String language) {
    setState(() {
      _selectedLanguage = language;
    });

    // Here you would update your app's localization
    // For example, using your existing localization setup:
    // AppLocalizations.setLocale(language == 'English' ? Locale('en', 'US') : Locale('sw', 'KE'));

    // Show a confirmation snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Language changed to $language'),
        backgroundColor: const Color(0xFF7B6AF0),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.back(),
        ),
        title: const Text(
          'Language',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select your preferred language',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),

              // English Option
              _buildLanguageOption(
                flag: '🇺🇸',
                language: 'English',
                isSelected: _selectedLanguage == 'English',
                onTap: () => _changeLanguage('English'),
              ),

              const Divider(height: 1),

              // Swahili Option
              _buildLanguageOption(
                flag: '🇰🇪',
                language: 'Swahili',
                isSelected: _selectedLanguage == 'Swahili',
                onTap: () => _changeLanguage('Swahili'),
              ),

              const Divider(height: 1),

              const SizedBox(height: 30),
              const Text(
                'Note: Changing the language will restart the application',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageOption({
    required String flag,
    required String language,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Text(
              flag,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(width: 16),
            Text(
              language,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            if (isSelected)
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF7B6AF0),
                ),
                child: const Icon(
                  Icons.check,
                  size: 16,
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Example of how to connect the language selection page to your settings page
// Add this code to the _buildSettingItem for Language in your SettingsPage:

// onTap: () async {
//   final selectedLanguage = await Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: (context) => const LanguageSelectionPage(),
//     ),
//   );
//
//   if (selectedLanguage != null) {
//     setState(() {
//       // Update the language subtitle in settings
//       // This assumes you have a variable to store it
//       _languageSubtitle = selectedLanguage;
//     });
//   }
// },
