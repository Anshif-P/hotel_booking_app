import 'dart:convert';

import 'package:hotel_booking_app/model/sharepref_model.dart';
import 'package:http/http.dart ' as http;

import '../res/urls.dart';

class Api {
  Future<http.Response> signUpFunction(Map<String, String> map) async {
    final url = '${Urls.baseUrl}${Urls.singupEndPoint}';
    final uri = Uri.parse(url);
    final body = jsonEncode(map);
    final response = await http
        .post(uri, body: body, headers: {'Content-Type': 'application/json'});
    return response;
  }

  Future<http.Response?> loginFunction(Map<String, String> map) async {
    http.Response response;
    final url = '${Urls.baseUrl}${Urls.loginEndPoint}';
    final uri = Uri.parse(url);
    final body = jsonEncode(map);
    response = await http
        .post(uri, body: body, headers: {'Content-Type': 'application/json'});
    return response;
  }

  Future<http.Response> addRoom(Map<String, dynamic> map) async {
    final token = SharedPrefModel.instance.getData('token');
    http.Response response;
    final url = '${Urls.baseUrl}${Urls.addRoomEndPoint}';
    final uri = Uri.parse(url);
    final body = jsonEncode(map);
    response = await http.post(
      uri,
      body: body,
      headers: {'Content-Type': 'application/json', 'vendortoken': '$token'},
    );
    return response;
  }

  Future<http.Response> getVenderRooms() async {
    final url = '${Urls.baseUrl}${Urls.getVendorRooms}';
    final uri = Uri.parse(url);
    final token = SharedPrefModel.instance.getData('token');
    final response = await http.get(uri, headers: {'vendortoken': '$token'});
    return response;
  }

  Future<http.Response> getVendorDetails() async {
    final url = '${Urls.baseUrl}${Urls.getVendorDetails}';
    final uri = Uri.parse(url);
    final token = SharedPrefModel.instance.getData('token');
    final response = await http.get(uri, headers: {'vendortoken': '$token'});
    return response;
  }

  Future<http.Response> deleteRoom(id) async {
    final url = '${Urls.baseUrl}${Urls.deleteRoon}$id';
    final uri = Uri.parse(url);
    final token = SharedPrefModel.instance.getData('token');
    final header = {'vendortoken': '$token'};
    final response = await http.delete(
      uri,
      headers: header,
    );
    return response;
  }

  Future<http.Response> updateRoom(Map<String, dynamic> map, String id) async {
    final token = SharedPrefModel.instance.getData('token');
    http.Response response;
    final url = '${Urls.baseUrl}${Urls.editRoom}$id';
    final uri = Uri.parse(url);
    final body = jsonEncode(map);
    response = await http.put(
      uri,
      body: body,
      headers: {'Content-Type': 'application/json', 'vendortoken': '$token'},
    );
    return response;
  }

  Future<http.Response> updateVendorDetails(Map<String, dynamic> map) async {
    final token = SharedPrefModel.instance.getData('token');
    final url = '${Urls.baseUrl}${Urls.editVendorDetails}';
    final uri = Uri.parse(url);
    final Map<String, String> header = {
      'Content-Type': 'application/json',
      'vendortoken': '$token'
    };
    final body = jsonEncode(map);
    final response = await http.patch(uri, body: body, headers: header);
    return response;
  }

  Future<http.Response> addCoupons(Map<String, dynamic> map) async {
    final token = SharedPrefModel.instance.getData('token');
    final url = '${Urls.baseUrl}${Urls.addCoupon}';
    final uri = Uri.parse(url);
    final body = jsonEncode(map);
    final header = {
      'Content-Type': 'application/json',
      'vendortoken': '$token'
    };
    final response = await http.post(uri, body: body, headers: header);
    return response;
  }

  Future<http.Response> getVendorCoupons() async {
    final token = SharedPrefModel.instance.getData('token');
    final url = '${Urls.baseUrl}${Urls.getVendorCoupons}';
    final uri = Uri.parse(url);
    final header = {
      'Content-Type': 'application/json',
      'vendortoken': '$token'
    };
    final response = await http.get(uri, headers: header);
    return response;
  }

  Future<http.Response> deleteCoupon(String id) async {
    final token = SharedPrefModel.instance.getData('token');
    final url = '${Urls.baseUrl}${Urls.deleteCoupon}${id}';
    final uri = Uri.parse(url);
    final header = {
      'Content-Type': 'application/json',
      'vendortoken': '$token'
    };
    final response = await http.delete(uri, headers: header);
    return response;
  }

  getVendorBookings() async {
    final token = SharedPrefModel.instance.getData('token');
    final url = '${Urls.baseUrl}${Urls.getVendorBooking}';
    final uri = Uri.parse(url);
    final header = {
      'Content-Type': 'application/json',
      'vendortoken': '$token'
    };
    final response = await http.get(uri, headers: header);
    return response;
  }
}
