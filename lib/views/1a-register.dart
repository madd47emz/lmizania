
import 'package:flutter/material.dart';
import '../view_models/register_vm.dart';
import '../views/1aa-emailVerification.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var email = "";
  var username = "";
  var password = "";
  var _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  final RegisterViewmodel vmodel = RegisterViewmodel();
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
                    padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "أنشء\nحسابا",
                          textAlign: TextAlign.end,
                          style: TextStyle(color: Colors.white,fontFamily: 'Riwaya',fontWeight: FontWeight.bold, fontSize: 60),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 75,vertical: 5),
                    child: TextFormField(
                        onChanged: (p) => {username = p},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "يرجى اسم المستخدم";
                          }

                          if (value.length < 3) {
                            return ("3 مدخلات على الاقل");
                          } else {
                            return null;
                          }
                        },
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.end,
                        decoration: InputDecoration(
                          prefixIcon: IconButton(
                              onPressed: () {},
                              icon:  Icon(
                                Icons.person,
                                color: Colors.white.withOpacity(0.8),
                              )),

                          enabled: true,
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.white),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white.withOpacity(0.8)),
                          ),
                          hintText: "اسم المستخدم",
                          hintStyle: TextStyle(
                            fontFamily: 'Riwaya',
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                        cursorColor: Colors.white),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 5),
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
                              borderSide: BorderSide(
                                  color: Colors.white),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white.withOpacity(0.8)),
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
                              return "البريد الإلكتروني";
                            }
                            if(!RegExp(r"^[a-zA-Z0-9._+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                .hasMatch(value)){return (" خطأ في صيغة البريد الإلكتروني");}
                            else {
                              return null;
                            }
                          },
                          cursorColor: Colors.white)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 75,vertical: 5),
                    child: TextFormField(
                        onChanged: (p) => {password = p},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "يرجى ادخال كلمة المرور";
                          }

                          if (value.length < 8) {
                            return ("8 مدخلات على الاقل");
                          } else {
                            return null;
                          }
                        },
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.end,
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          prefixIcon: IconButton(
                              onPressed: () {},
                              icon:  Icon(
                                Icons.lock_outline,
                                color: Colors.white.withOpacity(0.8),
                              )),
                          suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.white.withOpacity(0.8),
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              }),
                          enabled: true,
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.white),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white.withOpacity(0.8)),
                          ),
                          hintText: "كلمة المرور",
                          hintStyle: TextStyle(
                            fontFamily: 'Riwaya',
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        // validator:
                        cursorColor: Colors.white),
                  ),
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
                          String message = await vmodel.register(username, email, password);
                          Navigator.pop(context);
                          if(message =="success") {Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EmailVerification()));


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
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Center(
                          child: Text(
                            'أنشء حسابا',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 155,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 46),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "!اللآن ",
                          style: TextStyle(
                            fontFamily: 'Riwaya',
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Text(
                            "سجل دخول",
                            style: TextStyle(
                                fontFamily: 'Riwaya',
                                color: Colors.white,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                        Text(
                          " ،لديك حساب بالفعل؟ اذا",
                          style: TextStyle(
                            fontFamily: 'Riwaya',
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
