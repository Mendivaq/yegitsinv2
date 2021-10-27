import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yegitsinv2/pages/home/home_page.dart';
import 'package:yegitsinv2/pages/login/components/login_auth_provider.dart';
import 'package:yegitsinv2/pages/login/login_page.dart';
import 'package:yegitsinv2/pages/signup/components/signup_auth_provider.dart';
import 'package:yegitsinv2/pages/signup/signup_page.dart';
import 'package:yegitsinv2/pages/welcome/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignUpAuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginAuthProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'YeGitsin',
        theme: ThemeData(
            primarySwatch: Colors.red,
            appBarTheme:
                AppBarTheme(iconTheme: IconThemeData(color: Colors.black))),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,userSnp){
            if(userSnp.hasData){
              return HomePage();
            }
            return WelcomePage();
          }
        ),
      ),
    );
  }
}
