import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yegitsinv2/pages/home/home_page.dart';
import 'package:yegitsinv2/route/routing_page.dart';

class SignUpAuthProvider with ChangeNotifier {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(SignUpAuthProvider.pattern.toString());
  UserCredential? userCredential;



  bool loading=false;

  void signupValidation(
      {required TextEditingController? adSoyad,
      required TextEditingController? eposta,
      required TextEditingController? sifre,
      required BuildContext context}) async {
    if (adSoyad!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Ad/Soyad alanı boş bırakılamaz!"),
        ),
      );
      return;
    } else if (eposta!.text.trim().isEmpty) {
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
    } else if (sifre.text.length <= 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Şifre alanı 8 karakterden az olamaz!"),
        ),
      );
      return;
    } else {
      try {
        loading=true;
        notifyListeners();
        userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: eposta.text,
          password: sifre.text,
        );
        loading=true;
        notifyListeners();
        FirebaseFirestore.instance
            .collection("users")
            .doc(userCredential!.user!.uid)
            .set(
          {
            "adSoyad": adSoyad.text,
            "eposta": eposta.text,
            "sifre": sifre.text,
            "userUid": userCredential!.user!.uid
          },
        ).then((value) {
          loading=false;
          notifyListeners();
          RoutingPage.goTonext(context: context, navigateTo: HomePage());;});
        }on FirebaseAuthException catch (e){
        loading=false;
        notifyListeners();
        if(e.code=="weak-password"){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Zayıf Şifre"),
            ),
          );
        }else if(e.code=="email-already-in-use"){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Bu e-posta ile zaten bir hesap var!"),
            ),
          );
        }

      }
      }
    }
  }

