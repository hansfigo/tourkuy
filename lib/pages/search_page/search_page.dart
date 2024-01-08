import 'package:flutter/material.dart';
import 'package:tourkuy/common_widgets/bottom_navigation.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Text("Search"), bottomNavigationBar: MyBottomNavigation());
  }
}
