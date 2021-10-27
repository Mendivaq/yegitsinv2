import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yegitsinv2/pages/home/home_page.dart';
import 'package:yegitsinv2/route/routing_page.dart';
import 'package:yegitsinv2/widgets/my_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEdit = false;
  TextEditingController adSoyad =
      TextEditingController(text: userModel.adSoyad);
  TextEditingController eposta = TextEditingController(text: userModel.eposta);
  Widget textFromField({required String hintText}) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: ListTile(
        leading: Text(hintText),
      ),
    );
  }

  nonEditTextField() {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("images/non_profile.png"),
          radius: 50,
        ),
        SizedBox(
          height: 15,
        ),
        textFromField(hintText: userModel.adSoyad),
        SizedBox(
          height: 10,
        ),
        textFromField(hintText: userModel.eposta)
      ],
    );
  }

  Widget editTextField() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("images/non_profile.png"),
              radius: 50,
            ),
          ],
        ),
        TextFormField(
          controller: adSoyad,
          decoration: InputDecoration(
            hintText: userModel.adSoyad,
          ),
        ),
        TextFormField(
          controller: eposta,
          decoration: InputDecoration(
            hintText: userModel.eposta,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        MyButton(
          onPressed: () {
            buildUpdateProfile();
            Fluttertoast.showToast(
                msg: "Güncellendi! Yönlendiriliyorsunuz ",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
              fontSize: 20.0

            );
          },
          text: "Güncelle",
        )
      ],
    );
  }

  buildUpdateProfile() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      "adSoyad":adSoyad.text,
      "eposta":eposta.text
    }).then((value) => RoutingPage.goTonext(context: context, navigateTo: HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: isEdit
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isEdit = false;
                  });
                },
                icon: Icon(Icons.close),
              )
            : IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                ),
              ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isEdit = true;
              });
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: isEdit ? editTextField() : nonEditTextField(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
