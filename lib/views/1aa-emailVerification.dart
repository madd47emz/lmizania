import 'package:flutter/material.dart';
import '../view_models/emailVerification_vm.dart';
import '../views/2-dash.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  var otp = "";
  final _formKey = GlobalKey<FormState>();
  final EmailVerificationViewModel vmodel = EmailVerificationViewModel();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/login-bg.png"))),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
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
                          "تحقق\nبريدك",
                          style: TextStyle(color: Colors.white,fontFamily: 'Riwaya',fontWeight: FontWeight.bold, fontSize: 70),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 75, vertical: 5),
                      child: TextFormField(
                          onChanged: (e) => {otp = e},
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.numbers,
                              color: Colors.white.withOpacity(0.8),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.8)),
                            ),
                            hintText: "كلمة السر لمرة واحدة",
                            hintStyle: TextStyle(
                              fontFamily: 'Riwaya',
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                          maxLength: 6,

                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "يرجى ادخال كلمة السر لمرة واحدة";
                            }
                            if (value.length < 6) {
                              return ("6 مدخلات");
                            }
                            else {
                              return null;
                            }
                          },
                          cursorColor: Colors.white)),
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
                          bool message = await vmodel.verifyEmail(otp);
                          Navigator.pop(context);
                          if(message) {Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Dash()));


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
                                          "Invalid Email"),
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
                            'سجل دخول',
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
                  SizedBox(height: 255,)

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
