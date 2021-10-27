import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yegitsinv2/pages/home/home_page.dart';
import 'package:yegitsinv2/pages/login/login_page.dart';
import 'package:yegitsinv2/pages/profile_page.dart';
import 'package:yegitsinv2/route/routing_page.dart';
Color myHexColor = Color.fromRGBO(216, 57, 43, 1);

class BuildDrawer extends StatelessWidget {

  const BuildDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(userModel.adSoyad),
              accountEmail: Text(userModel.eposta),
              currentAccountPicture:const CircleAvatar(
                backgroundImage: AssetImage("images/non_profile.png"),
              ) ,
              decoration: BoxDecoration(color: myHexColor),
            ),
             ListTile(
              leading: IconButton(
                  onPressed: () {
                    RoutingPage.goTonext(context: context, navigateTo: ProfilePage());

                  },
                icon: Icon(Icons.person),
              ),
              title: Text("Profilim"),
            ),
             ListTile(
              leading: IconButton(
                onPressed: () {

                },
                  icon: Icon(Icons.shopping_cart_rounded),

              ),
              title: Text("Siparişlerim"),
            ),
            ListTile(
              leading: IconButton(
                 onPressed: () {

                 },
                icon: Icon(Icons.favorite),
              ),
              title: Text("Favorilerim"),
            ),
            ListTile(
              leading: IconButton(
                 onPressed: () {

                 },
                icon: Icon(Icons.shopping_basket_sharp),
              ),
              title: Text("Sepetim"),
            ),
             ListTile(
               leading: IconButton(icon: Icon(Icons.exit_to_app_sharp),
                 onPressed: () {
                   FirebaseAuth.instance.signOut().then(
                         (value) => Navigator.of(context).push(
                       MaterialPageRoute(
                         builder: (context) => LoginPage(),
                       ),
                     ),
                   );
                 },

               ),
               title: Text("Çıkış Yap"),
             )
             /*ListTile(
              leading: IconButton(onPressed: () {
                FirebaseAuth.instance.signOut().then(
                      (value) => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  ),
                );
              }, icon: Icon(Icons.exit_to_app_sharp)),
              title: Text("Çıkış Yap"),

            ),*/
          ],
        ),
      );
  }
}
