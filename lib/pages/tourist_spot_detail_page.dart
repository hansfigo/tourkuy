import 'package:flutter/material.dart';
import 'package:tourkuy/interface/attraction.dart';

class TouristSpotDetailPage extends StatefulWidget {
  final TouristSpot attraction;

  const TouristSpotDetailPage({super.key, required this.attraction});

  @override
  _TouristSpotDetailPageState createState() => _TouristSpotDetailPageState();
}

class _TouristSpotDetailPageState extends State<TouristSpotDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text(widget.attraction.name));
  }
}
