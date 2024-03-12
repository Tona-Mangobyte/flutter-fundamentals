import 'dart:ui';

class Application {
  final List<String> languageCodes = ['en', 'kh'];
  late LocaleChangeCallback onLocaleChanged;
  late HomeScreenReloadCallback onHomeReload;

  Iterable<Locale> supportedLocales() {
    return languageCodes.map<Locale>((language) {
      return Locale(language);
    });
  }
}

Application application = Application();

typedef LocaleChangeCallback = void Function(Locale locale);

typedef HomeScreenReloadCallback = void Function();