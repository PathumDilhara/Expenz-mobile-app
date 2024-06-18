import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/constants.dart';

class SharedOnBoardingScreen extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;

  const SharedOnBoardingScreen(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w600,
              color: kBlack,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: kGrey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
