import 'package:flutter/material.dart';
import 'package:multi_languages/utils/share_preference_util.dart';
import 'package:multi_languages/utils/string_keys.dart';
import 'package:multi_languages/utils/string_util.dart';
import 'package:multi_languages/localization/application.dart';

import '../localization/translator_delegate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _locale = 'en';

  @override
  void initState() {
    _setLocale();
    super.initState();
  }

  void _setLocale() async {
    try {
      _locale = await SharePreferencesUtil.getLocalePrefs();
      SharePreferencesUtil.setLocalePrefs(_locale);
    } catch (e) {
      SharePreferencesUtil.setLocalePrefs(_locale);
    }
  }

  Future onLocaleChange(Locale locale) async {
    SharePreferencesUtil.setLocalePrefs(locale.languageCode);
    setState(() {
      TranslatorDelegate(newLocale: locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(
        children: [
          Center(
            child: Text(StringUtil.getString(context, StringKeys.languages)),
          ),
          MaterialButton(
              onPressed: _showAnimatedDialog,
              color: Colors.deepPurple,
              child: const Text('Press me')
          )
        ],
      ),
    );
  }

  Future _buildSimpleDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          // return _buildSimple();
          return _buildAlertDialog();
        }

    );
  }
  Widget _buildSimple() {
    return SimpleDialog(
      title: const Text('Select language'),
      alignment: Alignment.bottomCenter,
      // contentPadding: const EdgeInsets.all(0),
      insetPadding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () {
            // Navigator.pop(context, 'English');
            print('English');
          },
          child: const Text('English'),
        ),
        SimpleDialogOption(
          onPressed: () {
            // Navigator.pop(context, 'Spanish');
            print('Spanish');
          },
          child: const Text('Spanish'),
        ),
        SimpleDialogOption(
          onPressed: () {
            // Navigator.pop(context, 'French');
            print('French');
          },
          child: const Text('French'),
        ),
      ],
    );
  }
  Widget _buildAlertDialog() {
    return AlertDialog(
      title: Text(StringUtil.getString(context, StringKeys.languages)),
      alignment: Alignment.bottomCenter,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      insetPadding: const EdgeInsets.all(0),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pop(context, 'English');
                print('English');
              },
              child: const Text('English'),
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                Navigator.pop(context, 'Spanish');
                print('Spanish');
              },
              child: const Text('Spanish'),
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                Navigator.pop(context, 'French');
                print('French');
              },
              child: const Text('French'),
            ),
          ],
        ),
      ),
    );
  }

  Future _showAnimatedDialog() {
    return Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false, // set to false so dialog background can be transparent
        pageBuilder: (BuildContext context, _, __) {
          return AlertDialog(
            title: Text(StringUtil.getString(context, StringKeys.languages)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            insetPadding: const EdgeInsets.all(0),
            alignment: Alignment.bottomCenter,
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context, 'Khmer');
                      print('Khmer');
                      // application.onLocaleChanged(const Locale('kh'));
                      onLocaleChange(const Locale('kh'));
                    },
                    child: const Text('Khmer'),
                  ),
                  const Divider(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context, 'English');
                      print('English');
                      // application.onLocaleChanged(const Locale('en'));
                      onLocaleChange(const Locale('en'));
                    },
                    child: const Text('English'),
                  ),
                  const Divider(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context, 'Japan');
                      print('Japan');
                    },
                    child: const Text('Japan'),
                  ),
                ],
              ),
            ),
          );
        },
        transitionDuration: Duration(seconds: 1), // Updated duration
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // return simpleFadeTransition(animation, child);
          return simpleSlideTransition(animation, child);
        },
      ),
    );
  }

  Widget simpleFadeTransition(animation, child) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child, // child is the value returned by pageBuilder
      ),
    );
  }

  Widget simpleSlideTransition(animation, child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1), // Start position
        end: Offset.zero, // End position
      ).animate(animation),
      child: child, // child is the value returned by pageBuilder
    );
  }
}