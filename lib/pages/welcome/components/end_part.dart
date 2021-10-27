import 'package:flutter/material.dart';
import 'package:yegitsinv2/pages/login/login_page.dart';
import 'package:yegitsinv2/pages/signup/signup_page.dart';
import 'package:yegitsinv2/route/routing_page.dart';
import 'package:yegitsinv2/widgets/my_button.dart';

class EndPart extends StatelessWidget {
  const EndPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyButton(
          onPressed: () {
            RoutingPage.goTonext(context: context, navigateTo: LoginPage());
          },
          text: "Giriş Yap",
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {},
          child: InkWell(
            onTap: () {
              RoutingPage.goTonext(context: context, navigateTo: SignupPage());
            },
            child: Text(
              "Kayıt Ol",
              style: TextStyle(
                color: Colors.white,

              ),
            ),
          ),
        )
      ],
    );
  }
}
