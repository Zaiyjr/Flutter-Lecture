import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/Login/loginMain.dart';
import 'package:my_app/views/myHomePage.dart';
 // Import your BLoC

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Myhomepage(),

    );
  }
}