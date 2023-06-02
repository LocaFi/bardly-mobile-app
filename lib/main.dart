import 'package:bardly_mobile_app/views/login/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Bardly',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemBlue,
        // brightness: Brightness.dark,
      ),
      home: LoginView(),
    );
  }
}
