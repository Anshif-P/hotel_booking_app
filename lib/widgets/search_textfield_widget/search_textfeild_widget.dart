import 'package:flutter/material.dart';

class SearchTextFeildWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmittedFunction;

  const SearchTextFeildWidget({
    Key? key,
    required this.controller,
    required this.onSubmittedFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.white,
      ),
      child: TextField(
        onSubmitted: onSubmittedFunction,
        controller: controller,
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.search_rounded,
            color: Colors.grey,
          ),
          hintText: 'Search your location',
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.only(top: 15),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
