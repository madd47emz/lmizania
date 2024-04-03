import 'package:flutter/material.dart';
import 'package:lmizania/views/res/colors.dart';
import 'package:lmizania/views/util/auth-h1-subtitles.dart';
import '../view_models/resetPassword_vm.dart';
import '../views/1-login.dart';
import '2-dash.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  var otp = "";
  var newPassword = "";
  var _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  final ResetPasswordViewmodel vmodel = ResetPasswordViewmodel();
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 88,
                  ),

                  AuthH1Sub(h1: "Update Password", sub: "You have passed the verification,\nnow you can change your password"),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        maxLength: 4,
                          onChanged: (p) => {otp = p},
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "enter otp";
                            }
                            if(!RegExp(r"^\d{4}$")
                                .hasMatch(value)){return ("otp must be 4 digits exactly");}
                            else {
                              return null;
                            }
                          },
                          style: const TextStyle(
                            color: mainColor,
                          ),
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.numbers,
                              color: accentColor,
                            ),
                            filled: true,
                            fillColor: mainColor.withOpacity(0.15),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: accentColor,width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: accentColor,width: 1,
                              ),),
                            hintText: "OTP",
                            hintStyle: TextStyle(
                              color: mainColor.withOpacity(0.75),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          cursorColor: mainColor)), //otp
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 8),
                    child: TextFormField(
                        onChanged: (p) => {newPassword = p},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter password";
                          }

                          if (value.length < 8) {
                            return ("Too short");
                          } else {
                            return null;
                          }
                        },
                        style: const TextStyle(color: mainColor),
                        textAlign: TextAlign.start,
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          prefixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.lock_outline,
                                color: accentColor,
                              )),
                          suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: accentColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              }),
                          filled: true,
                          fillColor: mainColor.withOpacity(0.15),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: accentColor,width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: accentColor,width: 1,
                            ),),
                          hintText: "New Password",
                          hintStyle: TextStyle(
                            color: mainColor.withOpacity(0.75),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        // validator:
                        cursorColor: mainColor),
                  ), //password
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 8),
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Renter password";
                          }

                          if (value != newPassword) {
                            return ("renter previous password");
                          } else {
                            return null;
                          }
                        },
                        style: const TextStyle(color: mainColor),
                        textAlign: TextAlign.start,
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          prefixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.lock_outline,
                                color: accentColor,
                              )),
                          suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: accentColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              }),
                          filled: true,
                          fillColor: mainColor.withOpacity(0.15),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: accentColor,width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: accentColor,width: 1,
                            ),),
                          hintText: "Confirm Password",
                          hintStyle: TextStyle(
                            color: mainColor.withOpacity(0.75),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        // validator:
                        cursorColor: mainColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: GestureDetector(
                      onTap: () async {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => getSuccessBottomSheet(context),
                        );
                        // if (_formKey.currentState!.validate()) {
                        //   showDialog(
                        //     context: context,
                        //     builder: (context) => const Center(
                        //       child:
                        //           CircularProgressIndicator(color: accentColor),
                        //     ),
                        //   );
                        //bool message = await vmodel.resetPassword(otp, newPassword);
                        //   Navigator.pop(context);
                        //   if (message) {
                        //      ScaffoldMessenger.of(context).showSnackBar(getSuccessSnackBar());
                        //
                        //   } else
                        //     showDialog(
                        //         context: context,
                        //         builder: (context) => AlertDialog(
                        //               title: const Text(
                        //                 "invalid otp",
                        //                 style: TextStyle(color: Colors.red),
                        //               ),
                        //               content: "enter sent otp",
                        //               actions: [
                        //                 GestureDetector(
                        //                     onTap: () {
                        //                       Navigator.pop(context);
                        //                     },
                        //                     child: Padding(
                        //                       padding:
                        //                           const EdgeInsets.all(8.0),
                        //                       child: Text("return",
                        //                           style: TextStyle(
                        //                               fontWeight:
                        //                                   FontWeight.bold,
                        //                               fontSize: 15,
                        //                               color: mainColor)),
                        //                     ))
                        //               ],
                        //             ));
                        // }
                      },
                      child: Container(
                        height: 46,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'Update',
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ), //update button
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


Widget getSuccessBottomSheet(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.3, // Adjust height as needed
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          blurRadius: 10.0,
          spreadRadius: 5.0,
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 80,
            color: mainColor,
          ),
          SizedBox(height: 10),
          Text(
            'Updated!',
            style: TextStyle(
              color: mainColor,
              fontFamily: 'Open Sans',
              fontSize: 32.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Your password has been updated successfully.',
            style: TextStyle(
              color: subtitlesColor,
              fontFamily: 'Open Sans',
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    ),
  );
}
SnackBar getSuccessSnackBar() {
  return SnackBar(
    backgroundColor: Colors.white,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.check_circle_outline,
          size: 80,
          color: mainColor,
        ),
        SizedBox(height: 10),
        Text(
          'Updated!',
          style: TextStyle(
            color: mainColor,
            fontFamily: 'Open Sans',
            fontSize: 32.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 5),
        Text(
          'Your password has been updated successfully.',
          style: TextStyle(
            color: subtitlesColor,
            fontFamily: 'Open Sans',
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}

