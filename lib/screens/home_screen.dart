import 'package:flutter/material.dart';
import 'package:flutter_book_app/screens/settings.dart';
import 'package:flutter_book_app/widgets/book_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(    
      appBar: AppBar(
        title: const Text('Anasayfa'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const Settings();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            BookCard(),
            BookCard(),
          ],
        ),
      ),
    );
  }
}
