import 'package:flutter/material.dart';

class PhoneHomeScreen extends StatelessWidget {
  static const valueKey = ValueKey("PhoneScreen");

  PhoneHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('PHONE HOME SCREEN'),
    );
  }
}