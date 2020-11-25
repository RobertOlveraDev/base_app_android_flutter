import 'package:flutter/material.dart';
import 'package:base_app_android_flutter/src/global/language_constants.dart';

class HomeTestLoactionPage extends StatelessWidget {
  const HomeTestLoactionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(getTranslated(context, 'home_page'))),
    );
  }
}
