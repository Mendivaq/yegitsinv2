import 'dart:core';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yegitsinv2/pages/home/home_page.dart';

class LoginAuthProvider with ChangeNotifier {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(LoginAuthProvider.pattern.toString());
  UserCredential ?userCredential;

  bool loading = false;

  void loginValidation(
      {required TextEditingController? eposta,
      required TextEditingController? sifre,
      required BuildContext context}) async {
    if (eposta!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("E-posta alanı boş bırakılamaz!"),
        ),
      );
      return;
    } else if (!regExp.hasMatch(eposta.text.trim())) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Geçersiz e-posta biçimi!"),
        ),
      );
      return;
    } else if (sifre!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Şifre alanı boş bırakılamaz!"),
        ),
      );
      return;
    } else if (sifre.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Şifre alanı 8 karakterden az olamaz!"),
        ),
      );
      return;
    } else {
      try {
        loading = false;
        notifyListeners();
        userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: eposta.text, password: sifre.text)
            .then(
          (value) async {
            loading = false;
            notifyListeners();
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
        );
        notifyListeners();
      } on FirebaseAuthException catch (e) {
        if (e.code == "user-not-found") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Kullanıcı bulunamadı!"),
            ),
          );
        } else if (e.code == "wrong-password") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Şifreniz yanlış!"),
            ),
          );
        }
      }
    }
  }
}
