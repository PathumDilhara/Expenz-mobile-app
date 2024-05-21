import 'package:f20_expenz_mobile_app/constants/colors.dart';
import 'package:flutter/material.dart';

class IncomeExpenseCard extends StatefulWidget {
  final String title;
  final double amount;
  final String imageUrl;
  final Color bgColor;

  const IncomeExpenseCard(
      {super.key,
      required this.title,
      required this.amount,
      required this.imageUrl,
      required this.bgColor});

  @override
  State<IncomeExpenseCard> createState() => _IncomeExpenseCardState();
}

class _IncomeExpenseCardState extends State<IncomeExpenseCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: kWhite),
              child: Center(
                child: Image.asset(
                  widget.imageUrl,
                  width: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400, color: kWhite),
                ),
                Text(
                  "\$${widget.amount.toStringAsFixed(0)}", // to remove decimal toStringAsFixed(0)
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold, color: kWhite),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
