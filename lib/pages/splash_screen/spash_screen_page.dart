import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tourkuy/pages/main_page.dart';

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
      const Duration(seconds: 1),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      "TourKuy",
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
    ));
  }
}
