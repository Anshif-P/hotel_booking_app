class VendorModel {
  final String id;
  final String? token;
  final String name;
  final String email;

  final String propertyName;
  final String propertyLocation;

  final bool isBanned;
  final String? image;

  VendorModel(
      {required this.id,
      this.token,
      required this.name,
      required this.email,
      required this.propertyName,
      required this.propertyLocation,
      required this.isBanned,
      required this.image});
  factory VendorModel.toJson(Map<String, dynamic> map) {
    return VendorModel(
        token: map['token'],
        image: map['image'],
        id: map['_id'],
        name: map['name'],
        email: map['email'],
        propertyName: map['propertyName'],
        propertyLocation: map['propertyLocation'],
        isBanned: map['isBanned']);
  }
}
