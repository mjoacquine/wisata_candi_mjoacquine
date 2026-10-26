import 'package:flutter/material.dart';
import 'package:wisata_candi_joacquine/data/candi_data.dart';
import 'package:wisata_candi_joacquine/screens/detail_screen.dart';
import 'package:wisata_candi_joacquine/screens/profile_screen.dart';
import 'package:wisata_candi_joacquine/screens/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Candi ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: DetailScreen(candi : candiList[0]) ,
        // home : ProfileScreen(),
        home : SignInScreen()
    );
  }
}

// class DetailScreen extends StatelessWidget {
//   const DetailScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
