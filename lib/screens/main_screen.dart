import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'main_screen_navigation_screens/add_new_screen.dart';
import 'main_screen_navigation_screens/budget_screen.dart';
import 'main_screen_navigation_screens/home_screen.dart';
import 'main_screen_navigation_screens/profile_screen.dart';
import 'main_screen_navigation_screens/transaction_screen.dart';

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
      const AddNewScreen(),
      const HomeScreen(),
      const TransactionScreen(),

      const BudgetScreen(),
      const ProfileScreen(),
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
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded),
            label: "Transaction",
          ),
          BottomNavigationBarItem(
              icon: Container(
                decoration: const BoxDecoration(
                  color: kMainColor,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(10),
                child: const Icon(
                  Icons.add,
                  color: kWhite,
                  size: 30,
                ),
              ),
              label: ""),
          const BottomNavigationBarItem(
            icon: Icon(Icons.rocket),
            label: "Budget",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "profile",
          ),
        ],
      ),
      body: screens[_currentPageIndex],
    );
  }
}
