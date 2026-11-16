import 'package:flutter/material.dart';
import 'package:wisata_candi_joacquine/data/candi_data.dart';
// Import model candi jika diperlukan, contoh:
// import 'package:wisata_candi_joacquine/models/candi.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO 1: Buat AppBar dengan judul Wisata Candi
      appBar: AppBar(
        title: const Text('Wisata Candi'),
      ),
      // TODO 2: Buat body dengan GridView.builder
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8, // Opsional: jarak antar kolom
          mainAxisSpacing: 8,  // Opsional: jarak antar baris
        ),
        padding: const EdgeInsets.all(8),
        itemCount: candiList.length,
        itemBuilder: (BuildContext context, int index) {
          // Buat variabel candi sesuai index
          final candi = candiList[index];

          // TODO 3: Return custom widget ItemCard
          return ItemCard(candi: candi);
        },
      ),
    );
  }
}