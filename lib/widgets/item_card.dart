import 'package:flutter/material.dart';
import 'package:wisata_candi_joacquine/models/candi.dart';
 import 'package:wisata_candi_joacquine/screens/detail_screen.dart';

class ItemCard extends StatelessWidget {
  // todo 1 deklrasikan variabel yang dibutuhkan dan pasang pada konstruktor
  final Candi candi;

  const ItemCard({super.key, required this.candi});

  @override
  Widget build(BuildContext context) {
    // todo 6 implementasi routing ke detail screen menggunakan InkWell atau GestureDetector
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(candi: candi), // Pastikan DetailScreen menerima parameter candi
          ),
        );
      },
      child: Card(
        // todo 2 tetapkan parameter shape, margin, dan elevation dari card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(4),
        elevation: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // todo 3 buat image sebagai anak dari column
            Expanded(
              // todo 7 implementasi hero animation
              child: Hero(
                tag: candi.imageAsset, // Tag unik untuk animasi hero (bisa menggunakan imageAsset atau name)
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    candi.imageAsset,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // todo 4 buat text pertama sebagai anak dari column (Nama Candi)
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Text(
                candi.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // todo 5 buat text kedua sebagai anak dari column (Tipe Candi)
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 8),
              child: Text(
                candi.type,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}