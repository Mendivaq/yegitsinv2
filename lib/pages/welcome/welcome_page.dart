import 'dart:ui';

import 'package:flutter/material.dart';

import 'components/center_part.dart';
import 'components/end_part.dart';
import 'components/top_part.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      /*decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              "images/yegitsinbackground.jpg" ),
          fit: BoxFit.cover,

        ),
      ),*/
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Top bölümü
            TopPart(),
            //Mid bölümü
            CenterPart(),
            //Son BÖlümü
            EndPart()
          ],
        ),
      ),
    ));
  }
}
