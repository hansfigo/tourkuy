import 'package:flutter/material.dart';
import 'package:tourkuy/common_widgets/input_field.dart';
import 'package:tourkuy/pages/home/home_page.dart';
import 'package:tourkuy/styles/style.dart';
import 'package:tourkuy/utils/auth.dart';
import 'package:tourkuy/utils/goto.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppStyles.primaryColor,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.all(16.0),
    minimumSize: const Size(double.infinity, 48),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String errorMsg = '';

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Buat Akun Baru",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                    ),
                    Text(
                      "Connecting Explorers to Endless Destinations",
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
                        labelText: "Username",
                        controller: usernameController,
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
                        height: 14,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Visibility(
                          visible: errorMsg.isNotEmpty,
                          child: Text(
                            errorMsg,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    // Set isLoading true saat proses login dimulai
                                    setState(() {
                                      isLoading = true;
                                    });

                                    await Auth.signUp(
                                        usernameController.text,
                                        emailController.text,
                                        emailController.text);

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Berhasil Login')),
                                    );

                                    goTo(context, const HomePage());
                                  } on AuthenticationException catch (e) {
                                    setState(() {
                                      errorMsg = e.message;
                                    });
                                  } finally {
                                    // Set isLoading false setelah proses login selesai (berhasil atau gagal)
                                    setState(() {
                                      isLoading = false;
                                    });
                                  }
                                }
                              },
                        style: buttonStyle,
                        child: isLoading
                            ? const SizedBox(
                                height: 24,
                                width: 24,
                                child:
                                    CircularProgressIndicator()) // Menampilkan spinner jika isLoading true
                            : const Text('Sign In'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Sudah Punya Akun ? ",
                  style: TextStyle(color: AppStyles.lightGray),
                ),
                GestureDetector(
                    onTap: () => goTo(context, const RegisterPage()),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(color: AppStyles.primaryColor),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
