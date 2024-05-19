import 'package:f20_expenz_mobile_app/constants/colors.dart';
import 'package:flutter/material.dart';

class RoundedCustomButton extends StatelessWidget {
  final String buttonName;
  final Color buttonColor;
  const RoundedCustomButton(
      {super.key, required this.buttonName, required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: buttonColor,
      ),
      child: Center(
        child: Text(
          buttonName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: kWhite,
          ),
        ),
      ),
    );
  }
}
