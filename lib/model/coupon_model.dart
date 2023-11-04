import 'package:intl/intl.dart';

class CouponModel {
  final String id;
  final String code;
  final String discount;
  final String startDate;
  final String endDate;
  CouponModel(
      {required this.id,
      required this.code,
      required this.discount,
      required this.startDate,
      required this.endDate});
  factory CouponModel.fromJson(Map<String, dynamic> json) {
    final startDate = DateFormat('yyyy-MM-dd').parse(json['startDate']);
    final tempSartDate = DateFormat('MMM-dd-yyyy').format(startDate);
    final endDate = DateFormat('yyyy-MM-dd').parse(json['endDate']);
    final tempEndDate = DateFormat('MMM-dd-yyyy').format(endDate);
    return CouponModel(
      id: json['_id'],
      code: json['couponCode'].toString(),
      discount: json['discount'].toString(),
      startDate: tempSartDate.toString(),
      endDate: tempEndDate.toString(),
    );
  }
}
