class PlacePoint {
  String name;
  String? address;
  double latitude;
  double longitude;
  String? hours;
  String? description;
  String? phone;
  String? imageUrl;

  PlacePoint({
    required this.name,
    required this.latitude,
    required this.longitude,
    this.address,
    this.hours,
    this.description,
    this.phone,
    this.imageUrl,
  });

  factory PlacePoint.fromJSON(Map<String, dynamic> json) {
    return PlacePoint(
      name: json['name'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      address: json['address'],
      hours: json['hours'],
      description: json['description'],
      phone: json['phone'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'hours': hours,
      'description': description,
      'phone': phone,
      'imageUrl': imageUrl,
    };
  }
}
