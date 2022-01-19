import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_book_app/models/book.dart';
import 'package:flutter_book_app/screens/add_book_screen.dart';
import 'package:flutter_book_app/screens/settings.dart';
import 'package:flutter_book_app/widgets/book_card.dart';

class HomeScreen extends StatefulWidget {
  List<Book>? bookList = [];
  HomeScreen({Key? key, this.bookList}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
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
      body: widget.bookList!.isNotEmpty
          ? ListView.builder(
              padding: EdgeInsets.only(bottom: _size.height * 0.02),
              itemCount: widget.bookList!.length,
              itemBuilder: (BuildContext context, int index) {
                return BookCard(book: widget.bookList![index],);
              })
          : Center(
              child: Text(
                'Kitap Eklemeye Başla!',
                style: TextStyle(
                  fontSize: 25,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddBookScreen()));
        },
      ),
    );
  }
}
