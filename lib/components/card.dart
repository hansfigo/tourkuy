import 'package:flutter/material.dart';
import 'package:tourkuy/interface/attraction.dart';
import 'package:tourkuy/pages/tourist_spot_detail_page.dart';

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
            SizedBox(
              height: cardHeight * 0.4,
              width: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  "https://images.unsplash.com/photo-1621155346337-1d19476ba7d6?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGltYWdlfGVufDB8fDB8fHww",
                  fit: BoxFit.cover,
                ),
              ),
            ),
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
                    Text(
                      (attraction.rating).toString(),
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(168, 0, 0, 0),
                      ),
                    ),
                    Text(
                      attraction.category,
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
