import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tourkuy/interface/attraction.dart';
import 'package:tourkuy/pages/login_page/login_page.dart';
import 'package:tourkuy/pages/tourist_spot_detail/tourist_spot_detail_page.dart';
import 'package:tourkuy/utils/goto.dart';

class CardExample extends StatelessWidget {
  final TouristSpot attraction;

  static const cardHeight = 300.0;

  const CardExample({super.key, required this.attraction});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Implementasikan navigasi ke halaman lain di sini
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TouristSpotDetailPage(attraction: attraction),
          ),
        );
      },
      child: SizedBox(
        height: cardHeight,
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: Stack(
                  children: [
                    Image.network(
                      "https://images.unsplash.com/photo-1621155346337-1d19476ba7d6?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGltYWdlfGVufDB8fDB8fHww",
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 10.0,
                      right: 10.0,
                      child: InkWell(
                        onTap: () => goTo(context, const LoginPage()),
                        child: const Icon(
                          Icons.bookmark,
                          color: Colors.white,
                          size: 18.0,
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      attraction.name,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    RatingBar.builder(
                      itemSize: 12,
                      initialRating: attraction.rating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.only(right: 2.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    Text(
                      attraction.location,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(168, 0, 0, 0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}