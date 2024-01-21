import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tourkuy/interface/attraction.dart';
import 'package:tourkuy/pages/login_page/page.dart';
import 'package:tourkuy/pages/tourist_spot_detail/page.dart';
import 'package:tourkuy/styles/style.dart';
import 'package:tourkuy/utils/goto.dart';

class CardExample extends StatelessWidget {
  final TouristSpot attraction;

  const CardExample({super.key, required this.attraction});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TouristSpotDetailPage(attraction: attraction),
          ),
        );
      },
      child: SizedBox(
        width: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 140,
                      child: Image.network(
                        attraction.thumbnail,
                        fit: BoxFit.cover,
                      ),
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
                    RatingStar(rating: attraction.rating),
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

class RatingStar extends StatelessWidget {
  const RatingStar({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemSize: 12,
      initialRating: rating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.only(right: 2.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: AppStyles.primaryColor,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
