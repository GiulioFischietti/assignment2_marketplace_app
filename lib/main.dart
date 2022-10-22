import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace_exercise/models/beer.dart';
import 'package:marketplace_exercise/models/product.dart';
import 'package:marketplace_exercise/providers/home_provider.dart';
import 'package:marketplace_exercise/providers/user_provider.dart';
import 'package:marketplace_exercise/screens/auth/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (_) => HomeProvider()),
        ],
        child: MaterialApp(
          theme: ThemeData(
              primaryColor: Colors.grey[100],
              scaffoldBackgroundColor: Colors.grey[100],
              backgroundColor: Colors.grey[100],
              textTheme: TextTheme(
                  headline1: GoogleFonts.poppins(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  bodyText1: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black))),
          debugShowCheckedModeBanner: false,
          title: 'MarketPlace',
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Login();
  }
}
