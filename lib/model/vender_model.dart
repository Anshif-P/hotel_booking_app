class VendorModel {
  final String id;
  final String? token;
  final String name;
  final String email;
  final String password;
  final String propertyName;
  final String propertyLocation;
  final String phone;
  final bool isBanned;

  VendorModel(
      {required this.id,
      this.token,
      required this.name,
      required this.email,
      required this.password,
      required this.propertyName,
      required this.propertyLocation,
      required this.phone,
      required this.isBanned});
  factory VendorModel.toJson(Map<String, dynamic> map) {
    return VendorModel(
        token: map['token'],
        id: map['_id'],
        name: map['name'],
        email: map['email'],
        password: map['password'],
        propertyName: map['propertyName'],
        propertyLocation: map['propertyLocation'],
        phone: map['phone'],
        isBanned: map['isBanned']);
  }
}
