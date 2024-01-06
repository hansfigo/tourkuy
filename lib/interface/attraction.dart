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

  factory Attraction.fromJson(Map<String, dynamic> json) {
    return Attraction(
      description: json['description'],
      thumbnail: json['thumbnail'],
      images: List<String>.from(json['image']),
      name: json['name'],
      category: json['kategori'],
      location: json['location'],
      rating: json['rating'].toDouble(),
    );
  }
}
