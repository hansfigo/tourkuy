import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tourkuy/common_widgets/card.dart';
import 'package:tourkuy/interface/attraction.dart';
import 'package:tourkuy/utils/auth.dart';
import 'package:tourkuy/utils/firebase/firebase.dart';

class BookmarkListWidget extends StatelessWidget {
  const BookmarkListWidget({super.key});

  Future<List<TouristSpot>> fetchWisataFromFirestore() async {
    final docRef = db
        .collection("bookmarks")
        .doc(Auth.getUserId())
        .collection('userBookmarks');

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await docRef.get();

    return querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data();
      return TouristSpot.fromFirestore(data);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TouristSpot>>(
      future: fetchWisataFromFirestore(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text("Error Occurred: ${snapshot.error}");
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text("Belum Ada Bookmarks");
        } else {
          List<TouristSpot> attractionList = snapshot.data!;
          return BookmarkList(bookmarkList: attractionList);
        }
      },
    );
  }
}

class BookmarkList extends StatelessWidget {
  final List<TouristSpot> bookmarkList;

  const BookmarkList({super.key, required this.bookmarkList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bookmarkList.length,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                CardExample(attraction: bookmarkList[index]),
              ],
            );
          } else {
            return Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                CardExample(attraction: bookmarkList[index]),
              ],
            );
          }
        },
      ),
    );
  }
}
