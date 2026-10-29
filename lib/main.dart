import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata_candi_joacquine/data/candi_data.dart';
import 'package:wisata_candi_joacquine/screens/detail_screen.dart';
import 'package:wisata_candi_joacquine/screens/profile_screen.dart';
import 'package:wisata_candi_joacquine/screens/sign_in_screen.dart';
import 'package:wisata_candi_joacquine/providers/favorite_provider.dart';
import 'package:wisata_candi_joacquine/providers/auth_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Candi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Diperbaiki dari .fromSeed menjadi ColorScheme.fromSeed
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: DetailScreen(candi: candiList[0]),
      // home: ProfileScreen(),
      // home: const SignInScreen(),
    );
  }
}