import 'package:f20_expenz_mobile_app/constants/colors.dart';
import 'package:f20_expenz_mobile_app/screens/main_screen_navigation_screens/add_new_screen.dart';
import 'package:f20_expenz_mobile_app/screens/main_screen_navigation_screens/budget_screen.dart';
import 'package:f20_expenz_mobile_app/screens/main_screen_navigation_screens/home_screen.dart';
import 'package:f20_expenz_mobile_app/screens/main_screen_navigation_screens/profile_screen.dart';
import 'package:f20_expenz_mobile_app/screens/main_screen_navigation_screens/transaction_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // current page index
  int _currentPageIndex = 0;


  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      AddNewScreen(),
      HomeScreen(),
      TransactionScreen(),

      BudgetScreen(),
      ProfileScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: kWhite,
        selectedItemColor: kMainColor,
        unselectedItemColor: kGrey,
        selectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        currentIndex: _currentPageIndex,
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded),
            label: "Transaction",
          ),
          BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                  color: kMainColor,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.add,
                  color: kWhite,
                  size: 30,
                ),
              ),
              label: ""),
          BottomNavigationBarItem(
            icon: Icon(Icons.rocket),
            label: "Budget",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "profile",
          ),
        ],
      ),
      body: screens[_currentPageIndex],
    );
  }
}
