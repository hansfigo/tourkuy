class TouristSpot {
  String overview;
  String sejarah;
  String? jamOperasi;
  double? tiket;
  String thumbnail;
  List<String>? images;
  String name;
  String category;
  String location;
  double rating;

  TouristSpot({
    required this.overview,
    required this.sejarah,
    required this.thumbnail,
    required this.name,
    required this.category,
    required this.location,
    required this.rating,
  });

  factory TouristSpot.fromFirestore(Map<String, dynamic> data) {
    return TouristSpot(
      overview: (data['overview']).toString(),
      sejarah: (data['sejarah'].toString()),
      thumbnail: data['thumbnail'].toString(),
      name: data['name'].toString(),
      category: data['category'].toString(),
      location: data['location'].toString(),
      rating: double.parse(data['rating'].toString()),
    );
  }
}
