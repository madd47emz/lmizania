import 'package:flutter/material.dart';
import 'package:lmizania/views/res/colors.dart';
import 'package:lmizania/views/util/auth-h1-subtitles.dart';
import '../view_models/login_vm.dart';
import '../views/1a-register.dart';
import '../views/1b-forgotpw.dart';
import '../views/2-dash.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email = "";
  var password = "";
  var _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  final LoginViewmodel vmodel = LoginViewmodel();
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

                  AuthH1Sub(h1: "Welcome Back", sub: "Login to your account"),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                            color: Color(0xFF007B7F),
                            fontSize: 32,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ), //login text
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                          onChanged: (e) => {email = e},
                          style: const TextStyle(
                            color: mainColor,
                          ),
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
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
                            hintText: "Username/Email",
                            hintStyle: TextStyle(
                              color: mainColor.withOpacity(0.75),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Username/Email";
                            } else {
                              return null;
                            }
                          },
                          cursorColor: mainColor)), //email
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TextFormField(
                        onChanged: (p) => {password = p},
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
                          enabled: true,
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
                          hintText: "Password",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPassword()));
                          },
                          child: Text(
                            "Forgot password?",
                            style: TextStyle(
                                color: mainColor.withOpacity(0.7),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline),
                          )),
                    ],
                  ), //forgot password
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: GestureDetector(
                      onTap: () async {
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
                        //   String message = await vmodel.login(email, password);
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
                            'Login',
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ), //login button
                  SizedBox(height: 175),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 2,
                        width: 120,
                        color: mainColor.withOpacity(0.75),
                      ),
                      Text(
                        "or",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: mainColor),
                      ),
                      Container(
                        height: 2,
                        width: 120,
                        color: mainColor.withOpacity(0.75),
                      ),
                    ],
                  ), //or separator
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: GestureDetector(
                      onTap: () async {},
                      child: Container(
                        height: 46,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: mainColor,width: 2
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child:  Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/google.png",height: 36,width: 36,),
                              Text(
                                'Sign in with google',
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: mainColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ), //sign in with google
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Dont have and account?",
                            style: TextStyle(
                              color: subtitlesColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()));
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: mainColor,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ), //register
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
