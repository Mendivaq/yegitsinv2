import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final void Function()? onPressed;
  final String text;
  MyButton({
    required this.onPressed,
    required this.text
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    Color myHexColor = Color.fromRGBO(216, 57, 43, 1);
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 25
      ),

      child: Container(
        height: 50,
        alignment: Alignment.center,
        child: Text(
          widget.text,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
