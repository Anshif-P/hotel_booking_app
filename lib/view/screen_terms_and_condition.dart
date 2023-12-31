import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../util/string/terms_and_condition_string.dart';

class ScreenTermsAndConditions extends StatelessWidget {
  const ScreenTermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            'Terms & Conditions',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back, color: Colors.black))),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(20),
        children: [
          terms('Acceptance Of Terms', AppTerms.acceptanceOfTerms),
          terms('Account Creation', AppTerms.accountCreation),
          terms('Accuracy', AppTerms.accuracy),
          terms('Content Moderation', AppTerms.content),
          terms('Intellectual Property ', AppTerms.property),
          terms('Limitation of Liability', AppTerms.limitationOfLiablility),
          terms('Privacy', AppTerms.privacy),
          terms('Changes To Terms', AppTerms.changeToTerms),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Column terms(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        Text(
          description,
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
