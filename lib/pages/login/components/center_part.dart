import 'package:flutter/material.dart';

class CenterPart extends StatelessWidget {
  final TextEditingController? eposta;
  final TextEditingController? sifre;
  final Widget icon;
  final bool obscureText;
  final void Function()? onPressed;
  const CenterPart(
      {required this.obscureText,
      required this.icon,
      required this.onPressed,
      required this.eposta,
      required this.sifre,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        TextFormField(
          controller: eposta,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "E-posta",
          ),
        ),
        SizedBox(
          height: 15,
        ),
        TextFormField(

          controller: sifre,
          obscureText: obscureText,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: "Şifre",
            suffixIcon: IconButton(
              icon: icon,
              onPressed: onPressed,
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
