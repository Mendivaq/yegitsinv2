

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:yegitsinv2/pages/login/login_page.dart';
import 'package:yegitsinv2/pages/signup/components/signup_auth_provider.dart';
import 'package:yegitsinv2/route/routing_page.dart';
import 'package:yegitsinv2/widgets/my_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}


class _SignupPageState extends State<SignupPage> {
  TextEditingController adSoyad = TextEditingController();
  TextEditingController eposta = TextEditingController();
  TextEditingController sifre = TextEditingController();
  bool visibility = false;
  @override
  Widget build(BuildContext context) {
    final TextStyle headline4 = Theme.of(context).textTheme.headline1!;
    SignUpAuthProvider signUpAuthProvider =
        Provider.of<SignUpAuthProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [

                  Text(
                    "YeGitsin",
                    style: GoogleFonts.norican(
                      textStyle: headline4,
                      fontSize: 80,
                      color: Colors.redAccent,
                      shadows: <Shadow>[
                        Shadow(
                            offset: Offset(0.0, 0.0),
                            blurRadius: 10.0,
                            color: Color.fromARGB(255, 0, 0, 0))
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    controller: adSoyad,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Ad/Soyad"),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: eposta,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "E-posta"),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    controller: sifre,
                    obscureText: visibility,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Şifre",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            visibility = !visibility;
                          });
                        },
                        icon: Icon(visibility
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      signUpAuthProvider.loading == false
                          ? MyButton(
                              onPressed: () {
                                signUpAuthProvider.signupValidation(
                                    adSoyad: adSoyad,
                                    eposta: eposta,
                                    sifre: sifre,
                                    context: context);
                              },
                              text: "Kayıt Ol",
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {
                              RoutingPage.goTonext(
                                  context: context, navigateTo: LoginPage());
                            },
                            child: Text("Zaten hesabın var mı ?\t\t")),
                        InkWell(
                            onTap: () {
                              RoutingPage.goTonext(
                                  context: context, navigateTo: LoginPage());
                            },
                            child: Text("GİRİŞ YAP"))
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
