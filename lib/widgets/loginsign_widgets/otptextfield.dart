import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  @override
  OtpTextFieldWidget createState() => OtpTextFieldWidget();
}

class OtpTextFieldWidget extends State<OTPScreen> {
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());

  @override
  void initState() {
    super.initState();
    _focusNodes[0].requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    //double heightMedia = MediaQuery.sizeOf(context).height;
    double widthMedia = MediaQuery.sizeOf(context).width;
    return Row(
      children: List.generate(
        4,
        (index) => Container(
          margin:
              const EdgeInsets.only(right: 10), // Adjust the horizontal margin
          child: SizedBox(
            width: widthMedia * 0.11,
            height: 59,
            child: TextFormField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  if (index < 3) {
                    _focusNodes[index + 1].requestFocus();
                  } else {
                    // All OTP fields are filled
                    String otp = '';
                    for (var controller in _controllers) {
                      otp += controller.text;
                    }
                    print('Entered OTP: $otp');
                  }
                } else if (index > 0) {
                  _focusNodes[index - 1].requestFocus();
                }
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color(
                          0xFFD1D1D1)), // Set the border color when not focused
                  borderRadius: BorderRadius.circular(12.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color(
                          0xFFD1D1D1)), // Set the border color when not focused
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }
}
