import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata_candi_joacquine/providers/favorite_provider.dart';
import 'package:wisata_candi_joacquine/providers/auth_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteCount = context.watch<FavoriteProvider>().count;

    // Mengambil status dan data dari AuthProvider
    final auth = context.watch<AuthProvider>();

    return Scaffold(
      body: Stack(
        children: [
          // Latar belakang header warna ungu (Slide hal. 7)
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple,
          ),
          // Bungkus Column dengan Padding horizontal 16 (Slide hal. 9)
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  // TODO: 2. Buat ProfileHeader (foto profil & ikon kamera) (Slide hal. 11-12)
                  Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.deepPurple, width: 2),
                              shape: BoxShape.circle,
                            ),
                            child: const CircleAvatar(
                              radius: 50,
                              backgroundImage:
                              AssetImage('images/placeholder_image.png'),
                            ),
                          ),
                          if (auth.isSignedIn)
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.camera_alt,
                                color: Colors.deepPurple[50],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // TODO: 3. Buat ProfileInfo (Slide hal. 14-15)
                  // Baris 1: Pengguna (mengambil data dari AuthProvider)
                  Row(children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: const Row(children: [
                        Icon(Icons.lock, color: Colors.amber),
                        SizedBox(width: 8),
                        Text('Pengguna', style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                      ]),
                    ),
                    Expanded(
                      child: Text(': ${auth.isSignedIn ? auth.username : ''}',
                          style: const TextStyle(fontSize: 18)),
                    ),
                  ]),
                  const SizedBox(height: 4),
                  Divider(color: Colors.deepPurple[100]),
                  const SizedBox(height: 4),

                  // Baris 2: Nama (Dilengkapi ikon edit jika signed in - Slide hal. 15)
                  Row(children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: const Row(children: [
                        Icon(Icons.person, color: Colors.blue),
                        SizedBox(width: 8),
                        Text('Nama', style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                      ]),
                    ),
                    Expanded(
                      child: Text(': ${auth.isSignedIn ? 'Jakues Wirya' : ''}',
                          style: const TextStyle(fontSize: 18)),
                    ),
                    if (auth.isSignedIn) const Icon(Icons.edit),
                  ]),
                  const SizedBox(height: 4),
                  Divider(color: Colors.deepPurple[100]),
                  const SizedBox(height: 4),

                  // Baris 3: Favorit
                  Row(children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: const Row(children: [
                        Icon(Icons.favorite, color: Colors.red),
                        SizedBox(width: 8),
                        Text('Favorit', style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                      ]),
                    ),
                    Expanded(
                      child: Text(': $favoriteCount',
                          style: const TextStyle(fontSize: 18)),
                    ),
                  ]),

                  // TODO: 4. Buat ProfileActions (Slide hal. 17)
                  const SizedBox(height: 4),
                  Divider(color: Colors.deepPurple[100]),
                  const SizedBox(height: 20),

                  // Menggunakan status dan fungsi dari AuthProvider dengan argumen yang valid
                  auth.isSignedIn
                      ? TextButton(
                    onPressed: () {
                      context.read<AuthProvider>().signOut();
                    },
                    child: const Text('Sign Out'),
                  )
                      : TextButton(
                    onPressed: () {
                      // Memberikan string argumen 'Jakues' ke dalam signIn
                      context.read<AuthProvider>().signIn('Jakues');
                    },
                    child: const Text('Sign In'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}