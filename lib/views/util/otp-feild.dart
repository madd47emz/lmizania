import 'package:flutter/material.dart';
import 'package:lmizania/views/res/colors.dart';
class OtpTextField extends StatefulWidget {
  String otp;
  OtpTextField({super.key, required this.otp});

  @override
  State<OtpTextField> createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {

  @override
  Widget build(BuildContext context) {
    const TextStyle _otpStyle = TextStyle(
      color: mainColor,
      fontFamily: 'Open Sans',
      fontSize: 32.0,
      fontWeight: FontWeight.w700,
    );
    return SizedBox(
      height: 62,
      width: 62.0,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        style: _otpStyle,
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        onChanged: (value) {
          setState(() {
            this.widget.otp = value;
          });
          FocusScope.of(context).nextFocus(); // Move focus to next field
        },
        cursorColor: mainColor.withOpacity(0.15),
        decoration: InputDecoration(
          filled: true,
          fillColor: mainColor.withOpacity(0.15),
          
          counterText: "", // Hide counter
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }
}

