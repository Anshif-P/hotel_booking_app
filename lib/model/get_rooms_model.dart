class VendorRoomModel {
  final String? id;
  final String? propertyName;
  final String? propertyType;
  final String? totalRoom;
  final String? price;
  final String? adultRate;
  final bool isApproved;
  final String? capacity;
  final String? address;
  final String? city;
  final String? state;
  final String? zip;
  final String? description;
  final List? amenities;
  final List? imageList;
  final String? category;
  final String? location;
  String? longitude;
  double? latitude;

  VendorRoomModel(
      {required this.totalRoom,
      this.propertyName,
      required this.id,
      required this.isApproved,
      required this.propertyType,
      required this.price,
      required this.adultRate,
      required this.capacity,
      required this.address,
      required this.city,
      required this.state,
      required this.zip,
      required this.description,
      required this.amenities,
      required this.imageList,
      required this.category,
      required this.location,
      required this.latitude,
      required this.longitude});
  factory VendorRoomModel.fromJson(map, propertyName) {
    return VendorRoomModel(
        propertyName: propertyName,
        id: map['_id'],
        isApproved: map['isApproved'],
        propertyType: map['propertyType'],
        totalRoom: map['totalrooms'],
        price: map['price'],
        adultRate: map['AdultsRate'],
        capacity: map['capacity'],
        address: map['address'],
        city: map['city'],
        state: map['state'],
        zip: map['zip'],
        description: map['description'],
        amenities: map['amenities'],
        imageList: map['img'],
        category: map['category'],
        location: map['location'],
        longitude: map['longitude'],
        latitude: map['latitude']);
  }
}
