class Attraction {
  String description;
  String thumbnail;
  List<String> images;
  String name;
  String category;
  String location;
  double rating;

  Attraction({
    required this.description,
    required this.thumbnail,
    required this.images,
    required this.name,
    required this.category,
    required this.location,
    required this.rating,
  });

  factory Attraction.fromFirestore(Map<String, dynamic> data) {
    return Attraction(
      description: data['description'] ?? '',
      thumbnail: data['Thumbnail'] ?? '',
      images: List<String>.from(data['image'] ?? []),
      name: data['name'] ?? '',
      category: data['category'] ?? '',
      location: data['location'] ?? '',
      rating: double.parse(data['rating'] ?? 0.0),
    );
  }
}
