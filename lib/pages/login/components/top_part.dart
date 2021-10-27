import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopPart extends StatelessWidget {
  const TopPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle headline4 = Theme.of(context).textTheme.headline1!;
    Color myHexColor = Color.fromRGBO(216, 57, 43, 1);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            SizedBox(height: 215,),

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
            )
          ],
        )
      ],
    );
  }
}
//ClipRRect(
//child: BackdropFilter(
//filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),child:            ),
