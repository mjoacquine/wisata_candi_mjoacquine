import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata_candi_joacquine/data/candi_data.dart';
import 'package:wisata_candi_joacquine/screens/detail_screen.dart';
import 'package:wisata_candi_joacquine/screens/profile_screen.dart';
import 'package:wisata_candi_joacquine/screens/search_screen.dart';
import 'package:wisata_candi_joacquine/screens/sign_in_screen.dart';
import 'package:wisata_candi_joacquine/providers/favorite_provider.dart';
import 'package:wisata_candi_joacquine/providers/auth_provider.dart';
import 'package:wisata_candi_joacquine/widgets/item_card.dart';
import 'package:wisata_candi_joacquine/screens/home_screen.dart';
import 'package:wisata_candi_joacquine/screens/favorite_screen.dart';
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
      
      // home: DetailScreen(candi: candiList[0]),
      // home: ProfileScreen(),
      // home: const SignInScreen(),
      // home: SearchScreen(),
      // home: HomeScreen(),
      home: MainScreen(),
    );
  }
}
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //todo 1 mendeklrasikan variabel
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //todo 2 buat properti body berupa widget yang ditampilkan
      body: _children[_currentIndex],
      // todo 3 buat properti bottomNavigatorBar dengan nilai theme
      // todo 4 buat data dan child dari theme
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.deepPurple[50],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.deepPurple[100],
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.deepPurple),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.deepPurple),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.deepPurple),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.deepPurple),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}