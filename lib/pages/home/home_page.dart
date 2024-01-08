import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourkuy/pages/home/widgets/horizontal_list.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
            color: Color.fromARGB(255, 6, 196, 158),
            height: 200.0,
            width: double.infinity,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jelajah",
                    style: TextStyle(fontSize: 42, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            )),
        const SizedBox(height: 40.0),
        const Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: TouristSpotListWidget(),
        )),
      ],
    ));
  }
}
