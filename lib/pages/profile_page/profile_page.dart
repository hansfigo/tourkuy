import 'package:flutter/material.dart';
import 'package:tourkuy/common_widgets/bottom_navigation.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Text("Profile"), bottomNavigationBar: MyBottomNavigation());
  }
}
