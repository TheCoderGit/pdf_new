import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../screens/home_screen.dart';
import '../feature/change_language/provider/change_language_provider.dart';
import '../l10n/app_localizations.dart';

class AndroidApp extends StatelessWidget {
  const AndroidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        // Read current locale
        final currentLocale = ref.watch(changeLanguageProvider).locale;
        return MaterialApp(
          title: 'PDF Manager',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            useMaterial3: true,
          ),
          locale: currentLocale,
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
          localizationsDelegates: const [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: const HomeScreen(),
        );
      },
    );
  }
}
