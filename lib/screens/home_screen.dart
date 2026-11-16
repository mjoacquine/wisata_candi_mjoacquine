import 'package:flutter/material.dart';
import 'package:wisata_candi_joacquine/data/candi_data.dart';
import  'package:wisata_candi_joacquine/widgets/item_card.dart';

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
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        padding:  EdgeInsets.all(8),
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