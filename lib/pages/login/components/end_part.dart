import 'package:flutter/material.dart';
import 'package:yegitsinv2/pages/signup/signup_page.dart';
import 'package:yegitsinv2/route/routing_page.dart';
import 'package:yegitsinv2/widgets/my_button.dart';

class EndPart extends StatelessWidget {
  final void Function()? onPressed;
  final bool loading;
  const EndPart({required this.loading, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        loading == true
            ? CircularProgressIndicator()
            : MyButton(
                onPressed: onPressed,
                text: 'Giriş Yap',
              ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                RoutingPage.goTonext(context: context, navigateTo: SignupPage());
              },
              child: Text(
                "Hesabın yok mu? \t\t",
                style: TextStyle(color: Colors.black),
              ),
            ),
            InkWell(
              onTap: () {
                RoutingPage.goTonext(context: context, navigateTo: SignupPage());
              },
              child: Text(
                "KAYDOL",
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        )
      ],
    );
  }
}
