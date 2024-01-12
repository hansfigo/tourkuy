import 'package:flutter/material.dart';
import 'package:tourkuy/common_widgets/input_field.dart';
import 'package:tourkuy/styles/style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi Lets Explore the World",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                ),
                Text(
                  "Explore Beyond Boundaries with Ease",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(
              height: 42,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  InputField(
                    labelText: "Email",
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  InputField(
                    labelText: "Password",
                    obscureText: true,
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Email :${emailController.text}')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppStyles
                          .primaryColor, // Set your desired button color
                      onPrimary: Colors.white, // Set text color to white
                      padding:
                          EdgeInsets.all(16.0), // Set padding for the button
                      minimumSize:
                          Size(double.infinity, 48), // Set width to full
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8.0), // Set border radius
                      ),
                    ),
                    child: const Text('Sign In'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
