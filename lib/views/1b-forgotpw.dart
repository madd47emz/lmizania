import 'package:flutter/material.dart';
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
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/login-bg.png"))),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Container(
                      height: 50,
                      width: 100,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "أعد ضبط \nكلمة سرك",
                          style: TextStyle(color: Colors.white,fontFamily: 'Riwaya',fontWeight: FontWeight.bold, fontSize: 70),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 75, vertical: 10),
                      child: TextFormField(
                          onChanged: (e) => {email = e},
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.white.withOpacity(0.8),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.8)),
                            ),
                            hintText: "البريد الإلكتروني",
                            hintStyle: TextStyle(
                              fontFamily: 'Riwaya',
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "يرجى ادخال البريد الإلكتروني";
                            }
                            if(!RegExp(r"^[a-zA-Z0-9._+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)){
                              return "صيغة البريد الإلكتروني خاطئة";
                            }
                            else {
                              return null;
                            }
                          },
                          cursorColor: Colors.white)),
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            builder: (context) => const Center(
                              child: CircularProgressIndicator(
                                  color: Colors.white),
                            ),
                          );
                          String message = await vmodel.verifyEmail(email);
                          Navigator.pop(context);
                          if(message == "success") {Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ResetPassword()));


                          } else
                            showDialog(
                                context: context,
                                builder: (context) =>
                                    AlertDialog(
                                      title: const Text(
                                        "Trouble",
                                        style: TextStyle(
                                            color:
                                            Colors.red),
                                      ),
                                      content:  Text(
                                          message),
                                      actions: [
                                        GestureDetector(
                                            onTap: () {
                                              Navigator.pop(
                                                  context);
                                            },

                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:  Text(
                                                  "return",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,

                                                      fontSize: 15,
                                                      color: Colors.black)),
                                            ))
                                      ],
                                    )
                            );

                        }
                      },
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Center(
                          child: Text(
                            'تأكد من الحساب',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              fontFamily: 'Riwaya',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "تذكرت كلمة المرور؟",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Riwaya',
                                decoration: TextDecoration.underline),
                          ))),
                  SizedBox(height: 230,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
