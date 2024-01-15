import 'package:flutter/material.dart';
import 'package:tourkuy/common_widgets/input_field.dart';
import 'package:tourkuy/pages/home/page.dart';
import 'package:tourkuy/pages/register_page/page.dart';
import 'package:tourkuy/styles/style.dart';
import 'package:tourkuy/utils/auth.dart';
import 'package:tourkuy/utils/goto.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    if (Auth.isUserSignIn()) {
      Future.delayed(Duration.zero, () async {
        goTo(context, const HomePage());
      });
    }
  }

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
                      "Hi Lets Explore the World",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
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

                                    await Auth.signIn(emailController.text,
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
                  "Belum Punya akun ? ",
                  style: TextStyle(color: AppStyles.lightGray),
                ),
                GestureDetector(
                    onTap: () => goTo(context, const RegisterPage()),
                    child: const Text(
                      "Daftar",
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
