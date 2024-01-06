import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tourkuy/components/card.dart';
import 'package:tourkuy/interface/attraction.dart';
import 'package:tourkuy/utils/firebase/firebase.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<dynamic>> loadWisataJson() async {
    const String data = '''[
    {
      "nama": "Candi Prambanan",
      "deskripsi": "Candi Hindu terbesar di Indonesia",
      "lokasi": "Sleman, Yogyakarta"
    },
    {
      "nama": "Taman Sari",
      "deskripsi": "Kompleks istana di Jogja dengan keindahan arsitektur",
      "lokasi": "Yogyakarta"
    },
    {
      "nama": "Malioboro",
      "deskripsi": "Jalan legendaris dengan berbagai pusat perbelanjaan",
      "lokasi": "Yogyakarta"
    }
  ]
    ''';
    return json.decode(data);
  }

  Future<List<Attraction>> fetchWisataFromFirestore() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await db.collection('wisata').get();

    return querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data();
      return Attraction.fromFirestore(data);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tourkuy")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: FutureBuilder(
          future: fetchWisataFromFirestore(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Attraction> attractionList = snapshot.data!;
              return AttractionList(attractionList: attractionList);
            } else if (snapshot.hasError) {
              return Text("Error Occurred: ${snapshot.error}");
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

class AttractionList extends StatelessWidget {
  final List<Attraction> attractionList;

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
