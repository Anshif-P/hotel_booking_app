class Reservation {
  final String id;
  final Room room;
  final User userId;
  final String vendorId;
  final int adult;
  final int rooms;
  final String location;
  final DateTime checkIn;
  final DateTime checkOut;
  final int roomPrice;
  final String type;
  final int total;
  final String address;
  final String phone;
  final String place;
  final int days;
  final bool isCancel;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Reservation({
    required this.id,
    required this.room,
    required this.userId,
    required this.vendorId,
    required this.adult,
    required this.rooms,
    required this.location,
    required this.checkIn,
    required this.checkOut,
    required this.roomPrice,
    required this.type,
    required this.total,
    required this.address,
    required this.phone,
    required this.place,
    required this.days,
    required this.isCancel,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['_id'],
      room: Room.fromJson(json['roomId']),
      userId: User.fromJson(json['userId']),
      vendorId: json['vendorId'],
      adult: json['adult'],
      rooms: json['rooms'],
      location: json['location'],
      checkIn: DateTime.parse(json['checkIn']),
      checkOut: DateTime.parse(json['checkOut']),
      roomPrice: json['RoomPrice'],
      type: json['type'],
      total: json['total'],
      address: json['address'],
      phone: json['phone'],
      place: json['place'],
      days: json['days'],
      isCancel: json['isCancel'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }
}

class Room {
  final String id;
  final Vendor vendor;
  final String propertyType;
  final String description;
  final String price;
  final String capacity;
  final String totalRoomRate;
  final String totalRooms;
  final String adultsRate;
  final String location;
  final String longitude;
  final String latitude;
  final String category;
  final List<String> amenities;
  final String parking;
  final bool isApproved;
  final bool isBanned;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Room({
    required this.id,
    required this.vendor,
    required this.propertyType,
    required this.description,
    required this.price,
    required this.capacity,
    required this.totalRoomRate,
    required this.totalRooms,
    required this.adultsRate,
    required this.location,
    required this.longitude,
    required this.latitude,
    required this.category,
    required this.amenities,
    required this.parking,
    required this.isApproved,
    required this.isBanned,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['_id'],
      vendor: Vendor.fromJson(json['vendorId']),
      propertyType: json['propertyType'],
      description: json['description'],
      price: json['price'],
      capacity: json['capacity'],
      totalRoomRate: json['totalRoomRate'],
      totalRooms: json['totalrooms'],
      adultsRate: json['AdultsRate'],
      location: json['location'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      category: json['category'],
      amenities: List<String>.from(json['amenities']),
      parking: json['parking'],
      isApproved: json['isApproved'],
      isBanned: json['isBanned'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }
}

class Vendor {
  final String id;
  final String vendorId;
  final String address;
  final String city;
  final String state;
  final String zip;
  final List<String> img;

  Vendor({
    required this.id,
    required this.vendorId,
    required this.address,
    required this.city,
    required this.state,
    required this.zip,
    required this.img,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      id: json['_id'],
      vendorId: json['vendorId'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      zip: json['zip'],
      img: List<String>.from(json['img']),
    );
  }
}

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String phone;
  final bool isBanned;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final dynamic address;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.isBanned,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
      isBanned: json['isBanned'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
      address: json['address'],
    );
  }
}
