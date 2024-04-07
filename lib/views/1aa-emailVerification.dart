import 'package:flutter/material.dart';
import 'package:lmizania/views/res/colors.dart';
import 'package:lmizania/views/util/auth-h1-subtitles.dart';
import 'package:lmizania/views/util/otp-feild.dart';
import '../view_models/1-emailVerification_vm.dart';
import '../views/2-dash.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  OtpTextField f1 = OtpTextField(otp: "");
  OtpTextField f2 = OtpTextField(otp: "");
  OtpTextField f3 = OtpTextField(otp: "");
  OtpTextField f4 = OtpTextField(otp: "");
  final _formKey = GlobalKey<FormState>();
  final EmailVerificationViewModel vmodel = EmailVerificationViewModel();
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

                  AuthH1Sub(h1: "Enter OTP", sub: "We have sent a verification code\nto your email address."),
              SizedBox(height: 48,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  f1,
                  f2,
                  f3,
                  f4
                ]),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: GestureDetector(
                      onTap: () async {
                        print(f1.otp+f2.otp+f3.otp+f4.otp);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dash()));

                        // if (_formKey.currentState!.validate()) {
                        //   showDialog(
                        //     context: context,
                        //     builder: (context) => const Center(
                        //       child:
                        //           CircularProgressIndicator(color: accentColor),
                        //     ),
                        //   );
                        //bool message = await vmodel.verifyEmail(f1.otp+f2.otp+f3.otp+f4.otp);
                        //   Navigator.pop(context);
                        //   if (message == "success") {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => Dash()));
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
                            'Verify',
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ), //verify button
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Didnt receive code?",
                          style: TextStyle(
                            color: subtitlesColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                          },
                          child: Text(
                            "Resnd",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: mainColor,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                  ),//resend

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
