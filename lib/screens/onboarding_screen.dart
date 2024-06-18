import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants/colors.dart';
import '../data/onboarding_screens_data.dart';
import '../widgets/rounded_custom_button.dart';
import 'onboarding_screens_widgets/front_page.dart';
import 'onboarding_screens_widgets/shared_onboarding_screen.dart';
import 'user_data_input_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // page controller
  final PageController _pageController = PageController(); // for page indicator
  bool isShowDetailsPage = false; // to identify current page is last page ?
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            // we need to show page dot indicator on all screens so use stack
            child: Stack(
              children: [
                PageView(
                  controller: _pageController, // for page indicator
                  // when pages change this function will call and steState again then at last page button name will be changed
                  onPageChanged: (index) {
                    setState(() {
                      isShowDetailsPage = index == 3;
                    });
                  },
                  children: [
                    const FrontPage(),
                    SharedOnBoardingScreen(
                      title:
                          OnBoardingScreensData.onBoardingScreensData[0].title,
                      imagePath: OnBoardingScreensData
                          .onBoardingScreensData[0].imagePath,
                      description: OnBoardingScreensData
                          .onBoardingScreensData[0].description,
                    ),
                    SharedOnBoardingScreen(
                      title:
                          OnBoardingScreensData.onBoardingScreensData[1].title,
                      imagePath: OnBoardingScreensData
                          .onBoardingScreensData[1].imagePath,
                      description: OnBoardingScreensData
                          .onBoardingScreensData[1].description,
                    ),
                    SharedOnBoardingScreen(
                      title:
                          OnBoardingScreensData.onBoardingScreensData[2].title,
                      imagePath: OnBoardingScreensData
                          .onBoardingScreensData[2].imagePath,
                      description: OnBoardingScreensData
                          .onBoardingScreensData[2].description,
                    ),
                  ],
                ),
                // page dot indicator
                Container(
                  alignment: const Alignment(0, 0.80),
                  child: SmoothPageIndicator(
                    controller:
                        _pageController, // now do relevant things with pageView
                    count: 4,
                    effect: const ExpandingDotsEffect(
                      expansionFactor: 3,
                      offset: 10,
                      spacing: 10,
                      radius: 100,
                      dotWidth: 10,
                      dotHeight: 10,
                      paintStyle: PaintingStyle.fill,
                      strokeWidth: 1,
                      dotColor: kLightGrey,
                      activeDotColor: kMainColor,
                    ),
                  ),
                ),

                // Navigation button, due set the position use position widget
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    // when touch the button change the page using _pagController.
                    // if we are not in last page show normal button and onboarding screen,
                    // else show user data input screen.
                    child: !isShowDetailsPage
                        ? GestureDetector(
                            onTap: () {
                              _pageController.animateToPage(
                                _pageController.page!.toInt() +
                                    1, // _pageController.page! give double value
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: RoundedCustomButton(
                              buttonName:
                                  isShowDetailsPage ? "Get Started" : "Next",
                              buttonColor: kMainColor,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              // Navigate to the user data input screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const UserDataInputScreen(),
                                ),
                              );
                            },
                            child: RoundedCustomButton(
                              buttonName:
                                  isShowDetailsPage ? "Get Started" : "Next",
                              buttonColor: kMainColor,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
