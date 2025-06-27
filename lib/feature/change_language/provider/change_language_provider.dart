import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// State class
class ChangeLanguageState {
  final Locale locale;
  const ChangeLanguageState(this.locale);
}

// Provider
final changeLanguageProvider =
    StateNotifierProvider<ChangeLanguageNotifier, ChangeLanguageState>(
  (ref) => ChangeLanguageNotifier(),
);

// Notifier with persistence
class ChangeLanguageNotifier extends StateNotifier<ChangeLanguageState> {
  static const _languageKey = 'app_language';

  ChangeLanguageNotifier() : super(const ChangeLanguageState(Locale('en'))) {
    _loadSavedLanguage();
  }

  Future<void> _loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString(_languageKey);
    if (langCode != null) {
      state = ChangeLanguageState(Locale(langCode));
    }
  }

  Future<void> setLanguage(Locale locale) async {
    state = ChangeLanguageState(locale);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, locale.languageCode);
  }
}
