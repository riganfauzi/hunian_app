class KostModel {
  final String id;
  final String name;
  final String location;
  final String city;
  final int price;
  final String type;
  final int availability;
  final double rating;
  final String image;
  final String description;
  final String facilities;
  final List<String> photos;

  KostModel({
    required this.id,
    required this.name,
    required this.location,
    required this.city,
    required this.price,
    required this.type,
    required this.availability,
    required this.rating,
    required this.image,
    required this.description,
    required this.facilities,
    required this.photos,
  });

  factory KostModel.fromJson(Map<String, dynamic> json) {
    final imageUrl = json['image']?.toString() ?? '';
    List<String> photoList = [];
    if (json['photos'] != null) {
      if (json['photos'] is List) {
        photoList = List<String>.from(json['photos']);
      } else {
        // Kalau string dipisah koma
        photoList = json['photos']
            .toString()
            .split(',')
            .map((e) => e.trim())
            .where((e) => e.isNotEmpty)
            .toList();
      }
    }
    return KostModel(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      location: json['location']?.toString() ?? '',
      city: json['city']?.toString() ?? '',
      price: int.tryParse(json['price']?.toString() ?? '0') ?? 0,
      type: json['type']?.toString() ?? '',
      availability: int.tryParse(json['availability']?.toString() ?? '0') ?? 0,
      rating: double.tryParse(json['rating']?.toString() ?? '0') ?? 0.0,
      image: imageUrl.startsWith('http')
          ? imageUrl
          : 'https://picsum.photos/seed/${json['id']}/200/300',
      description: json['description']?.toString() ?? '',
      facilities: json['facilities']?.toString() ?? '',
      photos: photoList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'city': city,
      'price': price,
      'type': type,
      'availability': availability,
      'rating': rating,
      'image': image,
      'description': description,
      'facilities': facilities,
    };
  }
}
