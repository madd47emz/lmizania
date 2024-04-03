import 'package:flutter/material.dart';
import 'package:lmizania/views/1aa-emailVerification.dart';
import 'package:lmizania/views/res/colors.dart';
import 'package:lmizania/views/util/auth-h1-subtitles.dart';
import '../view_models/forgetpw_vm.dart';

import '1ba-resetPassword.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var email = "";
  final _formKey = GlobalKey<FormState>();
  final ForgetPasswordViewmodel vmodel = ForgetPasswordViewmodel();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_circle_left_outlined,color: mainColor,size: 40,)),
        ),
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

                  AuthH1Sub(h1: "Forgot Password", sub: "Please enter the email address\nassociated with your account"),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                          onChanged: (p) => {email = p},
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "enter email";
                            }
                            if(!RegExp(r"^[a-zA-Z0-9._+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                .hasMatch(value)){return ("wrong email format");}
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
                              Icons.email,
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
                            hintText: "Email",
                            hintStyle: TextStyle(
                              color: mainColor.withOpacity(0.75),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: mainColor)), //email
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: GestureDetector(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResetPassword()));
                        // if (_formKey.currentState!.validate()) {
                        //   showDialog(
                        //     context: context,
                        //     builder: (context) => const Center(
                        //       child:
                        //           CircularProgressIndicator(color: accentColor),
                        //     ),
                        //   );
                        //String message = await vmodel.verifyEmail(email);
                        //   Navigator.pop(context);
                        //   if (message == "success") {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => EmailVerification()));
                        //   } else
                        //     showDialog(
                        //         context: context,
                        //         builder: (context) => AlertDialog(
                        //               title: const Text(
                        //                 "Trouble",
                        //                 style: TextStyle(color: Colors.red),
                        //               ),
                        //               content: Text(message),
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
                            'Submit',
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ), //submit button
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
