import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/change_language_provider.dart';

class LanguageDropdown extends ConsumerWidget {
  final String label;
  const LanguageDropdown({super.key, required this.label});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Read current locale
    final currentLocale = ref.watch(changeLanguageProvider).locale;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label),
        const SizedBox(width: 16),
        DropdownButton<Locale>(
          value: currentLocale,
          items: const [
            DropdownMenuItem(
              value: Locale('en'),
              child: Text('English'),
            ),
            DropdownMenuItem(
              value: Locale('ar'),
              child: Text('العربية'),
            ),
          ],
          onChanged: (locale) {
            if (locale != null) {
              // Change language to Arabic
              ref.read(changeLanguageProvider.notifier).setLanguage(locale);
            }
          },
        ),
      ],
    );
  }
}
