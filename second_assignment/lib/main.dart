import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app1/screen/signUpScreen.dart';

import 'screen/logInScreen.dart';

void main() => runApp(FirstDay());

class FirstDay extends StatelessWidget {
  const FirstDay({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MaterialApp(
      title: "First Day Sign In UI",
      debugShowCheckedModeBanner: false,
      home: LogInScreen(),
    );
  }
}
