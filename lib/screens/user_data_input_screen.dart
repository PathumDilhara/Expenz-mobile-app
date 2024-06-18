import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../services/user_services.dart';
import '../widgets/rounded_custom_button.dart';
import 'main_screen.dart';

class UserDataInputScreen extends StatefulWidget {
  const UserDataInputScreen({super.key});

  @override
  State<UserDataInputScreen> createState() => _UserDataInputScreenState();
}

class _UserDataInputScreenState extends State<UserDataInputScreen> {
  // for the checkbox
  bool _rememberMe = false;

  // form key for the form validation
  final _formKey = GlobalKey<FormState>();

  // controllers for the text form fields
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double radius = 15;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Enter your \nPersonal Details",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: kBlack,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // Form widget for creating form fields
                Form(
                  // for setup form validations without this we cant use validator property in textFormFields,
                  // and also that's why we use textFormFields within(as children of)  Form
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // form field for user name
                      TextFormField(
                        controller: _userNameController,
                        validator: (value) {
                          // check whether the user entered value/name is empty
                          if (value!.isEmpty) {
                            return "Please enter  your name";
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(radius)),
                            contentPadding: const EdgeInsets.all(10)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // form field for user e-mail
                      TextFormField(
                        // for validations
                        controller: _emailController,
                        validator: (value) {
                          // check whether the user entered value/name is empty
                          if (value!.isEmpty) {
                            return "Please enter  your email";
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(radius)),
                            contentPadding: const EdgeInsets.all(10)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // form field for user password
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          // check whether the user entered value/name is empty
                          if (value!.isEmpty) {
                            return "Please enter password";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(radius)),
                            contentPadding: const EdgeInsets.all(10)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // form field for user confirm password
                      TextFormField(
                        controller: _confirmPasswordController,
                        validator: (value) {
                          // check whether the user entered value/name is empty
                          if (value!.isEmpty) {
                            return "Please enter  same password";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(radius),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //   Remember me text and check box
                      Row(
                        children: [
                          const Text(
                            "Remember me for the next time",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: kGrey,
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              activeColor: kMainColor,
                              value: _rememberMe, // assign true or false to value
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value!; // opposite of above assigned value if true ---> false(if tik ok then tik for checkbox)
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // Submit Button
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            // form is valid, process data
                            String userName = _userNameController.text;
                            String email = _emailController.text;
                            String password = _passwordController.text;
                            String confirmPassword =
                                _confirmPasswordController.text;

                            // use these validated data for your work store or any
                            // save the user name and email in device
                            await UserServices.storeUserDetails(
                              userName: userName,
                              email: email,
                              password: password,
                              confirmPassword: confirmPassword,
                              context: context,
                            );

                            // Navigate to the main screen
                            if (context.mounted && (password == confirmPassword)) {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => const MainScreen(),),);
                            }
                          }
                        },
                        child: const RoundedCustomButton(
                            buttonName: "Next", buttonColor: kMainColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
