import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Candi ',
      theme: ThemeData(
        // This is the theme of your application.

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: DetailScreen(candi: candiList[0]) ,
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
