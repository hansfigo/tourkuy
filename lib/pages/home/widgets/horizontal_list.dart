import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tourkuy/common_widgets/card.dart';
import 'package:tourkuy/interface/attraction.dart';
import 'package:tourkuy/utils/firebase/firebase.dart';

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
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                CardExample(attraction: attractionList[2]),
              ],
            );
          } else {
            return Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                CardExample(attraction: attractionList[2]),
              ],
            );
          }
        },
      ),
    );
  }
}
