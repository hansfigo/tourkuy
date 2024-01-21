import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourkuy/common_widgets/bottom_navigation.dart';
// import 'package:tourkuy/pages/home/widgets/button_grid.dart';
import 'package:tourkuy/pages/home/widgets/horizontal_list.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final double sectionHeight = 250.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/home-bg.png'), // Ganti dengan path gambar Anda
                    fit: BoxFit.cover, // Atur sesuai kebutuhan Anda
                  ),
                ),
                height: 240.0,
                width: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16, top: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jelajahi",
                        style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: sectionHeight,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24.0),
                              child: Text(
                                'Jelajahi Sekitar anda',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w800),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Expanded(child: TouristSpotListWidget()),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: sectionHeight,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24.0),
                              child: Text(
                                'Jelajahi Sekitar anda',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w800),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Expanded(child: TouristSpotListWidget()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const MyBottomNavigation());
  }
}
