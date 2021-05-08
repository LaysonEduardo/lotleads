import 'package:flutter/material.dart';
import 'package:lotleads/loginscreen/loginscreen.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "LotLeads",
      home: LoginScreen(),
    );
  }
}
