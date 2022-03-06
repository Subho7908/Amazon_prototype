import 'package:amazonn/core/store.dart';
import 'package:amazonn/pages/home_page.dart';
import 'package:amazonn/pages/login_page.dart';
import 'package:amazonn/utills/routes.dart';
import 'package:amazonn/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(
    store: MyStore(),
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   

    return MaterialApp(
      debugShowCheckedModeBanner: false,
       
        themeMode: ThemeMode.light,
        home: HomePage(),
        theme:MyTheme.lightTheme(context) ,
        darkTheme: MyTheme.darkTheme(context),

       // initialRoute: "/login",
      /*  routes: {
         // "/": (context) => LoginPage(),
         // MyRouters.homeRoute: (context) =>HomePage(),
         // MyRouters.loginRoute: (context)=> LoginPage(),
        },*/
    );
  }
}
