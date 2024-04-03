
import 'package:flutter/material.dart';
import 'package:lmizania/views/res/colors.dart';
import '../view_models/register_vm.dart';
import '../views/1aa-emailVerification.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var email = "";
  var fullname = "";
  var password = "";
  var _isObscure = true;
  var _isAgreed = false;
  final _formKey = GlobalKey<FormState>();
  final RegisterViewmodel vmodel = RegisterViewmodel();
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
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Sign Up",style: TextStyle(color: Color(0xFF007B7F),fontSize: 32,fontWeight: FontWeight.w700),),
                    ],
                  ), //Sign up text
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                          onChanged: (p) => {fullname = p},
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "enter full name";
                            }
                            if(!RegExp(r"^[a-zA-Z]+( [a-zA-Z]+)*$")
                                .hasMatch(value)){return ("wrong name format");}
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
                            hintText: "Full name",
                            hintStyle: TextStyle(
                              color: mainColor.withOpacity(0.75),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          keyboardType: TextInputType.name,
                          cursorColor: mainColor)), //full name
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
                    padding:
                    const EdgeInsets.symmetric(vertical: 8),
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
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 8),
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Renter password";
                          }

                          if (value != password) {
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
                  ), //confirm password
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: GestureDetector(

                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EmailVerification()));
                        // if (_formKey.currentState!.validate()) {
                        //   if(_isAgreed){
                        //   showDialog(
                        //     context: context,
                        //     builder: (context) => const Center(
                        //       child: CircularProgressIndicator(
                        //           color: accentColor),
                        //     ),
                        //   );
                        //   String message = await vmodel.register(fullname,email, password);
                        //   Navigator.pop(context);
                        //   if(message =="success") {Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) =>
                        //               EmailVerification()));
                        //
                        //
                        //   } else
                        //     showDialog(
                        //         context: context,
                        //         builder: (context) =>
                        //             AlertDialog(
                        //               title: const Text(
                        //                 "Trouble",
                        //                 style: TextStyle(
                        //                     color:
                        //                     Colors.red),
                        //               ),
                        //               content:  Text(
                        //                   message),
                        //               actions: [
                        //                 GestureDetector(
                        //                     onTap: () {
                        //                       Navigator.pop(
                        //                           context);
                        //                     },
                        //
                        //                     child: Padding(
                        //                       padding: const EdgeInsets.all(8.0),
                        //                       child:  Text(
                        //                           "return",
                        //                           style: TextStyle(
                        //                               fontWeight: FontWeight.bold,
                        //
                        //                               fontSize: 15,
                        //                               color: mainColor)),
                        //                     ))
                        //               ],
                        //             )
                        //     );
                        //   }
                        //   else{
                        //     showDialog(
                        //         context: context,
                        //         builder: (context) =>
                        //             AlertDialog(
                        //               title: const Text(
                        //                 "Not Checked",
                        //                 style: TextStyle(
                        //                     color:
                        //                     Colors.red),
                        //               ),
                        //               content:  Text(
                        //                   "You have to agree to the privacy policy and terms of conditions"),
                        //               actions: [
                        //                 GestureDetector(
                        //                     onTap: () {
                        //                       Navigator.pop(
                        //                           context);
                        //                     },
                        //
                        //                     child: Padding(
                        //                       padding: const EdgeInsets.all(8.0),
                        //                       child:  Text(
                        //                           "return",
                        //                           style: TextStyle(
                        //                               fontWeight: FontWeight.bold,
                        //
                        //                               fontSize: 15,
                        //                               color: mainColor)),
                        //                     ))
                        //               ],
                        //             )
                        //     );
                        //
                        //   }
                        //}

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
                            'Sign up',
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),//sign up button
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(value: _isAgreed, onChanged: (check){
                          setState(() {
                            _isAgreed= check!;
                          });
                        },activeColor: mainColor,),
                        Column(
                          children: [

                            Row(
                              children: [
                                Text(
                                  "I agree to the ",
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
                                    "Privacy Policy",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: mainColor, decoration: TextDecoration.underline
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "and ",
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
                                    "terms of conditions.",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: mainColor, decoration: TextDecoration.underline
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                      ],
                    ),
                  ), //policy agree
                  SizedBox(height: 105),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 2,
                        width: 120,
                        color: mainColor.withOpacity(0.75),
                      ),
                      Text("or", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: mainColor),),
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
                      onTap: () async {
                      },
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
                                'Sign up with google',
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: mainColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ), //sign up with google
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                              color: subtitlesColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: mainColor, decoration: TextDecoration.underline
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ), //back to login
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
