import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const _localizedValues = <String, Map<String, String>>{
    'en': {
      'home_title': 'Home Screen',
      'languages': 'Languages:',
    },
    'ar': {
      'home_title': 'الشاشة الرئيسية',
      'languages': 'اللغات:',
    },
  };

  String get homeTitle => _localizedValues[locale.languageCode]!['home_title']!;
  String get languages => _localizedValues[locale.languageCode]!['languages']!;
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}
