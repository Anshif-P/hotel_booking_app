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
    print('response');
    print(response.body);
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
    print('in api fnc');
    final token = SharedPrefModel.instance.getData('token');
    http.Response response;
    final url = '${Urls.baseUrl}${Urls.addRoomEndPoint}';
    final uri = Uri.parse(url);
    print(map);
    final body = jsonEncode(map);
    response = await http.post(
      uri,
      body: body,
      headers: {'Content-Type': 'application/json', 'vendortoken': '$token'},
    );
    print(map);
    print(response.body);
    return response;
  }

  Future<http.Response> getVenderRooms() async {
    final url = '${Urls.baseUrl}${Urls.getVendorRooms}';
    final uri = Uri.parse(url);
    final token = SharedPrefModel.instance.getData('token');

    final response = await http.get(uri, headers: {'vendortoken': '$token'});
    print('heoloooo');
    print(response.body);
    return response;
  }

  Future<http.Response> getVendorDetails() async {
    final url = '${Urls.baseUrl}${Urls.getVendorDetails}';
    final uri = Uri.parse(url);
    final token = SharedPrefModel.instance.getData('token');
    final response = await http.get(uri, headers: {'vendortoken': '$token'});
    print(response.statusCode);
    print('get vendor fnc');
    print(response.body);
    return response;
  }
}
