import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tourkuy/pages/home_page.dart';

class SlashScreenPage extends StatefulWidget {
  const SlashScreenPage({super.key});

  @override
  State<SlashScreenPage> createState() => _SlashScreenPageState();
}

class _SlashScreenPageState extends State<SlashScreenPage> {
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: const Text("TourKuy", style: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w600
    ),));
  }
}

// class SlashScreenPage extends StatelessWidget {
//   const SlashScreenPage({super.key});

//   @override
//   void initState(){

//   }
//   @override
//   Widget build(BuildContext context) {
//     return const Text("Splash Screen");
//   }
// }
