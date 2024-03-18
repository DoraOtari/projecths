import 'package:flutter/material.dart';
import 'package:projecths/pages/shoppage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Court"),
      ),
      body: Text("Hallo Dek"),
    );
  }
}