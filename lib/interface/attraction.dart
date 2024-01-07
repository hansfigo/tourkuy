class TouristSpot {
  String description;
  String thumbnail;
  List<String> images;
  String name;
  String category;
  String location;
  double rating;

  TouristSpot({
    required this.description,
    required this.thumbnail,
    required this.images,
    required this.name,
    required this.category,
    required this.location,
    required this.rating,
  });

  factory TouristSpot.fromFirestore(Map<String, dynamic> data) {
    return TouristSpot(
      description: data['description'] ?? '',
      thumbnail: data['Thumbnail'] ?? '',
      images: List<String>.from(data['image'] ?? []),
      name: data['name'] ?? '',
      category: data['category'] ?? '',
      location: data['location'] ?? '',
      rating: data['rating'] ?? 0.0,
    );
  }
}
