import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  // method to store the user and user email in shared preferences
  // due to for take some time to store data use 'Future' methode(Asynchronous)
  static Future<void> storeUserDetails({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    try {
      // check whether the user entered password and confirm password are same
      // let show message using 'SnackBar', we use 'scaffold context' here so pass 'buildContext' above,
      // and to find where to pass this SnackBar message now we know place using passed context
      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Password not match"),
          ),
        );
        return; // to terminate, if not return below code will run
      }
      // if the user password and conf password are same then store the user name and email
      // create an instance from shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //  store the user name and email as key value pairs
      await prefs.setString("userName", userName);
      await prefs.setString("email", email);

      // show a message to user that data are stored
      if (context.mounted) { // error may be(but not, it's ok) gives context may be not mounted due to asynchronous(above functions are in await)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("User data stored successfully"),
          ),
        );
      }
    } catch (err) {
      err.toString();
    }
  }

  // method to check whether the userName is saved in the shared preferences
  static Future <bool> checkUserName() async {
    // create an instance for shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString("userName");
    return userName != null; // if has a userName ---> true otherwise(if null)(!=) false
  }
}
