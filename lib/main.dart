import 'package:flutter/material.dart';
import 'package:projecths/pages/homepage.dart';
import 'package:projecths/pages/detailpage.dart';
import 'package:projecths/pages/shoppage.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/'       : (context) => MyApp(),
    },
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    int menuDipilih = 0;

  List<Widget> halaman = <Widget>[
    HomePage(),
    ShopPage(),
  ];

  void menuDitap(int index){
    setState(() {
      menuDipilih = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: halaman.elementAt(menuDipilih),
     bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home"
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_rounded),
            label: "Shop"
            ),
        ],
        onTap: menuDitap,
        currentIndex: menuDipilih,
        ),
    );
  }
}

