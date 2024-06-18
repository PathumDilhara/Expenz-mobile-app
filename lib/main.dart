import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'services/user_services.dart';
import 'widgets/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserServices.checkUserName(),
      builder: (context, snapshot) {
        // if the snapshot is still waiting
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          //here the has userName will be set to true data is the
          // in the snapshot and otherwise false
          bool hasUserName = snapshot.data ?? false;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Expenze App",
            theme: ThemeData(
              fontFamily: "Inter",
            ),
            home: Wrapper(showMainScreen: hasUserName,),
          );
        }
      },
    );
  }
}
