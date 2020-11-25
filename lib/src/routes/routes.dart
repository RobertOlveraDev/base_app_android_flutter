import 'package:flutter/material.dart';
import 'package:base_app_android_flutter/src/pages/login/HomeTestLoactionPage.dart';

getApplicationsRouts() => <String, WidgetBuilder>{
      '/': (BuildContext context) => HomeTestLoactionPage(),
      // '/home': (BuildContext context) => HomePage(),
      // '/registration': (BuildContext context) => RegistrationPage(),
      // '/avatar': (BuildContext context) => AvatarPage(),
      // '/card': (BuildContext context) => CardPage(),
    };
