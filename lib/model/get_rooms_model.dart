class VendorRoomModel {
  final String roomNo;
  final String price;
  final String adultRate;
  final String OneRoom;
  final String capacity;
  final String address;
  final String city;
  final String state;
  final String zip;
  final String description;
  final String amenities;
  final String image;
  final String category;
  final String location;

  VendorRoomModel(
      {required this.roomNo,
      required this.price,
      required this.adultRate,
      required this.OneRoom,
      required this.capacity,
      required this.address,
      required this.city,
      required this.state,
      required this.zip,
      required this.description,
      required this.amenities,
      required this.image,
      required this.category,
      required this.location});
  factory VendorRoomModel.toJson(Map<String, dynamic> map) {
    return VendorRoomModel(
        roomNo: map['roomNo'],
        price: map['price'],
        adultRate: map['adultRate'],
        OneRoom: map['OneRoom'],
        capacity: map['capacity'],
        address: map['address'],
        city: map['city'],
        state: map['state'],
        zip: map['zip'],
        description: map['description'],
        amenities: map['amenities'],
        image: map['image'],
        category: map['category'],
        location: map['location']);
  }
}
