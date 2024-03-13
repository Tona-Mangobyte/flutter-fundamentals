import 'package:flutter/material.dart';
import 'package:multi_languages/screens/home_screen.dart';
import 'package:multi_languages/utils/navigator_holder.dart';
import 'package:multi_languages/utils/share_preference_util.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:multi_languages/localization/translator_delegate.dart';
import 'package:multi_languages/localization/application.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TranslatorDelegate _newLocaleDelegate = const TranslatorDelegate(newLocale: null);

  intiState() {
    SharePreferencesUtil.getLocalePrefs().then((code) {
      setState(() {
        _newLocaleDelegate = TranslatorDelegate(newLocale: Locale(code));
      });
    });
    application.onLocaleChanged = onLocaleChange;
    super.initState();
  }

  Future onLocaleChange(Locale locale) async {
    SharePreferencesUtil.setLocalePrefs(locale.languageCode);
    setState(() {
      _newLocaleDelegate = TranslatorDelegate(newLocale: locale);
    });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      localizationsDelegates: [
        _newLocaleDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: application.supportedLocales(),
      navigatorKey: NavigatorHolder().navigatorKey,
    );
  }
}