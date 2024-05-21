import 'package:f20_expenz_mobile_app/constants/colors.dart';
import 'package:f20_expenz_mobile_app/services/user_services.dart';
import 'package:f20_expenz_mobile_app/widgets/income_expence_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // for store the userName
  String userName = "";

  // this will call at startup building widget tree of this screen/ executing this code
  @override
  void initState() {
    // get the user name from the shared preferences
    UserServices.getUserData().then((value) {
      if (value["userName"] != null) {
        setState(() {
          userName = value["userName"]!;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // sub Column with bg color
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: BoxDecoration(
              color: kMainColor.withOpacity(0.3),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: kMainColor,
                          border: Border.all(
                            color: kMainColor,
                            width: 3,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            "assets/images/user.jpg",
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Welcome, $userName",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications,
                          size: 30,
                          color: kMainColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IncomeExpenseCard(
                          title: "Income",
                          amount: 1200,
                          imageUrl: "assets/images/income.png",
                          bgColor: kGreen),
                      IncomeExpenseCard(
                          title: "Expense",
                          amount: 1000,
                          imageUrl: "assets/images/expense.png",
                          bgColor: kRed),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
