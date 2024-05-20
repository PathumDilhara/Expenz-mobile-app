import 'package:f20_expenz_mobile_app/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

import '../screens/main_screen.dart';

class Wrapper extends StatefulWidget {
  final bool showMainScreen;
  const Wrapper({
    super.key,
    required this.showMainScreen,
  });

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    // which screen show accord to boolean showMainScreen
    return widget.showMainScreen
        ? const MainScreen()
        : const OnBoardingScreen();
  }
}
