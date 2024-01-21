import 'package:flutter/material.dart';
import 'package:tourkuy/common_widgets/bottom_navigation.dart';
import 'package:tourkuy/pages/login_page/page.dart';
import 'package:tourkuy/pages/profile_page/widgets/history_list.dart';
import 'package:tourkuy/pages/profile_page/widgets/outlined_button.dart';
import 'package:tourkuy/pages/register_page/page.dart';
import 'package:tourkuy/styles/style.dart';
import 'package:tourkuy/utils/auth.dart';
import 'package:tourkuy/utils/firebase/firebase.dart';
import 'package:tourkuy/utils/goto.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    if (Auth.isUserSignIn()) {
      return Scaffold(
          body: Column(
            children: [
              Container(
                color: AppStyles.primaryColor,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 200,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30.0)),
                          ),
                          height: 200,
                        )
                      ],
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width / 2 - 90,
                      top: 120,
                      child: Column(
                        children: [
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://i.pinimg.com/564x/11/8a/2c/118a2c9d4fb6f9837c0a2cd42c3a5d7c.jpg'),
                            minRadius: 90,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            auth.currentUser!.displayName!,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'History',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w800),
                            ),
                            BookmarkListWidget()
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                              ),
                              onPressed: () => Auth.signOut(),
                              child: const Text(
                                "SignOut",
                                style: TextStyle(color: Colors.white),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          bottomNavigationBar: const MyBottomNavigation());
    }
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Daftar untuk mulai planning trip anda.",
                style: AppStyles.headingStyle,
              ),
              const SizedBox(
                height: 18,
              ),
              MyOutlineButton(
                text: "Daftar Akun",
                onPressed: () => goTo(context, const RegisterPage()),
              ),
              const SizedBox(
                height: 10,
              ),
              MyOutlineButton(
                text: "Masuk Akun",
                onPressed: () => goTo(context, const LoginPage()),
              )
            ],
          ),
        ),
        bottomNavigationBar: const MyBottomNavigation());
  }
}
