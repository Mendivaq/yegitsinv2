import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:yegitsinv2/pages/login/components/center_part.dart';
import 'package:yegitsinv2/pages/login/components/end_part.dart';
import 'package:yegitsinv2/pages/login/components/login_auth_provider.dart';
import 'package:yegitsinv2/pages/login/components/top_part.dart';
import 'package:yegitsinv2/widgets/my_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
// şifre gözüküp gözükmemesini düzelt!
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController eposta = TextEditingController();
  TextEditingController sifre = TextEditingController();
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    LoginAuthProvider loginAuthProvider =
        Provider.of<LoginAuthProvider>(context);
    final TextStyle headline4 = Theme.of(context).textTheme.headline1!;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          /*decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/yegitsinbackground.jpg"),
              fit: BoxFit.cover,
            ),
          ),*/
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                //üst
                TopPart(),
                //center
                CenterPart(
                  obscureText:visible ,
                  eposta: eposta,
                  sifre: sifre,
                  onPressed: () {
                    setState(() {
                      visible = !visible;
                      print(visible);
                    });

                  },
                  icon: Icon(visible?Icons.visibility_off:Icons.visibility),
                ),
                //bottom
                EndPart(
                  loading: loginAuthProvider.loading,
                  onPressed: () {
                    loginAuthProvider.loginValidation(
                        eposta: eposta, sifre: sifre, context: context);
                  },
                )
              ],
            ),
          ),
        ));
  }
}
