import 'package:flutter/material.dart';
import 'package:tourkuy/common_widgets/bottom_navigation.dart';
import 'package:tourkuy/interface/attraction.dart';
import 'package:tourkuy/styles/style.dart';

class TouristSpotDetailPage extends StatefulWidget {
  final TouristSpot attraction;

  const TouristSpotDetailPage({super.key, required this.attraction});

  @override
  State<TouristSpotDetailPage> createState() => _TouristSpotDetailPageState();
}

class _TouristSpotDetailPageState extends State<TouristSpotDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            widget.attraction.thumbnail,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Column(
              children: [
                Text(
                  widget.attraction.name,
                  style: AppStyles.headingStyle,
                ),
                Text(
                  widget.attraction.overview,
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const MyBottomNavigation(),
    );
  }
}
