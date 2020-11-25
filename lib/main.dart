import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:base_app_android_flutter/src/global/localizations.dart';
import 'package:base_app_android_flutter/src/pages/commons/not_found_page.dart';
import 'package:base_app_android_flutter/src/routes/routes.dart';
import 'package:base_app_android_flutter/src/styles/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  // Create the initilization Future outside of `build`:
  @override
  _AppState createState() => _AppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _AppState state = context.findAncestorStateOfType<_AppState>();
    state.setLocale(newLocale);
  }
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  Locale _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Text(''),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return initMainPage(context);
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Text('Loagind'),
        );
      },
    );
  }

  Widget initMainPage(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Magyssu',
      theme: getAppTheme(),
      initialRoute: '/',
      routes: getApplicationsRouts(),
      onGenerateRoute: (RouteSettings settings) {
        //Ruta cuando no encuentra
        return MaterialPageRoute(builder: (context) => NotFoundPage());
      },
      locale: _locale,
      supportedLocales: [Locale("en", "US"), Locale("es", "MX")],
      localizationsDelegates: [
        MyLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}
