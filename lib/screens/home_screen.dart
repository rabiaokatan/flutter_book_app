import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_book_app/db/book_db.dart';
import 'package:flutter_book_app/models/book.dart';
import 'package:flutter_book_app/screens/add_book_screen.dart';
import 'package:flutter_book_app/screens/settings.dart';
import 'package:flutter_book_app/widgets/book_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Book> books;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshBooks();
  }

  @override
  void dispose() {
    BookDatabase.instance.close();

    super.dispose();
  }

  Future refreshBooks() async {
    setState(() {
      isLoading = true;
    });

    books = await BookDatabase.instance.readAllBook();

    setState(() {
      isLoading = false;
    });
  }

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
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : books.isNotEmpty
              ? ListView.builder(
                  padding: EdgeInsets.only(bottom: _size.height * 0.02),
                  itemCount: books.length,
                  itemBuilder: (BuildContext context, int index) {
                    return BookCard(
                      bookId: books[index].id!,
                      book: books[index],
                    );
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
        backgroundColor: Theme.of(context).primaryColorLight,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddBookScreen(),
            ),
          );

          refreshBooks();
        },
      ),
    );
  }
}
