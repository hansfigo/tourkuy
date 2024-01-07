import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourkuy/components/bottom_navigation.dart';
import 'package:tourkuy/components/card.dart';
import 'package:tourkuy/interface/attraction.dart';
import 'package:tourkuy/providers/bottom_navigation_provider.dart';
import 'package:tourkuy/utils/firebase/firebase.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  static const List<Widget> _widgetOptions = <Widget>[
    TouristSpotListWidget(),
    Text(
      'Index 1: Profile',
    ),
    Text(
      'Index 2: School',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Tourkuy")),
        body:
            _widgetOptions.elementAt(ref.watch(bottomNavigationProvider).state),
        bottomNavigationBar: const MyBottomNavigation());
  }
}

class TouristSpotListWidget extends StatelessWidget {
  const TouristSpotListWidget({super.key});

  Future<List<TouristSpot>> fetchWisataFromFirestore() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await db.collection('wisata').get();

    return querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data();
      return TouristSpot.fromFirestore(data);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchWisataFromFirestore(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<TouristSpot> attractionList = snapshot.data!;
          return AttractionList(attractionList: attractionList);
        } else if (snapshot.hasError) {
          return Text("Error Occurred: ${snapshot.error}");
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class AttractionList extends StatelessWidget {
  final List<TouristSpot> attractionList;

  const AttractionList({super.key, required this.attractionList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: attractionList.length,
      itemBuilder: (context, index) {
        return CardExample(attraction: attractionList[index]);
      },
    );
  }
}
