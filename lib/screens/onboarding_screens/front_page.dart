import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Image.asset("assets/images/logo.png", width: 100,
      fit: BoxFit.cover,),
        const SizedBox(height: 10,),
        const Text("Expenz", style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: kMainColor,
        ),)
      ],
    );
  }
}
