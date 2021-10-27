import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yegitsinv2/model/user_model.dart';
import 'package:yegitsinv2/pages/login/login_page.dart';
import 'package:yegitsinv2/widgets/build_drawer.dart';

late UserModel userModel;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future getCurrentUserDataFunction() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        userModel = UserModel.fromDocument(documentSnapshot);
      } else {
        print("Döküman veritabanında bulunamadı");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    getCurrentUserDataFunction();
    return Scaffold(
        drawer: BuildDrawer(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Material(
                elevation: 7,
                shadowColor: Colors.grey[300],
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search_sharp),
                      fillColor: Colors.white,
                      hintText: "Arayacağınız ürünü giriniz...",
                      filled: true,
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              ),
            ),
            ListTile(
              leading: Text(
                "Kategoriler",
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Categories(
                    categoryName: "Yemek",
                    image: "images/yegtsinv2rac.png",
                  ),
                  Categories(
                    categoryName: "Burger",
                    image: "images/yegtsinv2rac.png",
                  ),
                  Categories(
                    categoryName: "Yemek",
                    image: "images/yegtsinv2rac.png",
                  )
                ],
              ),
            ),
            ListTile(
              leading: Text(
                "Ürünler",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SingleProduct(),
                  SingleProduct(),
                ],
              ),
            ),
            ListTile(
              leading: Text(
                "En çok satılan ürünler",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SingleProduct(),
                  SingleProduct(),
                ],
              ),
            ),
          ],
        ));
  }
}

class Categories extends StatelessWidget {
  final String image;
  final String categoryName;
  const Categories({Key? key, required this.image, required this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      height: 100,
      width: 200,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          color: Colors.purple,
          borderRadius: BorderRadius.circular(60)),
      child: Center(
        child: Text(categoryName),
      ),
    );
  }
}

class SingleProduct extends StatelessWidget {
  const SingleProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: EdgeInsets.all(12),
        height: 200,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(20)),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "\₺80",
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              "Ay Çiçek Yağı",
              style: TextStyle(fontWeight: FontWeight.normal),
            )
          ],
        ),
      )
    ]);
  }
}
