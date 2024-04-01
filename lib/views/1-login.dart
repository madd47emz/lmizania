import 'package:flutter/material.dart';
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
                          "مرحبا\n!بعودتك",
                          textAlign: TextAlign.end,
                          style: TextStyle(color: Colors.white,fontFamily: 'Riwaya',fontWeight: FontWeight.bold, fontSize: 70),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 75, vertical: 5),
                      child: TextFormField(
                          onChanged: (e) => {email = e},
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white.withOpacity(0.8),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.8)),
                            ),
                            hintText: "اسم المستخدم أو البريد الإلكتروني",
                            hintStyle: TextStyle(
                              fontFamily: 'Riwaya',
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "يرجى ادخال اسم المستخدم أو البريد الإلكتروني";
                            }
                            else {
                              return null;
                            }
                          },
                          cursorColor: Colors.white)),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 75, vertical: 5),
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
                              icon: Icon(
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
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.8)),
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
                          String message = await vmodel.login(email, password);
                          Navigator.pop(context);
                          if(message =="success") {Navigator.push(
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
                            'تسجيل دخول',
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPassword()));
                          },
                          child: Text(
                            "نسيت كلمة المرور؟",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Riwaya',
                                decoration: TextDecoration.underline),
                          ))),
                  SizedBox(height: 175,),
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
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                          child: Text(
                            "أنشء حسابا",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Riwaya',
                                decoration: TextDecoration.underline),
                          ),
                        ),
                        Text(
                          " ،لا تملك حسابا؟ اذا",
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
