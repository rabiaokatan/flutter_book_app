import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_book_app/models/book.dart';
import 'package:flutter_book_app/screens/home_screen.dart';
import 'package:intl/intl.dart';

class AddBookScreen extends StatefulWidget {
  const AddBookScreen({Key? key}) : super(key: key);

  @override
  State<AddBookScreen> createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _bookController = TextEditingController();
    TextEditingController _authorController = TextEditingController();
    TextEditingController _pageController = TextEditingController();
    TextEditingController _timeController = TextEditingController();
    Size _size = MediaQuery.of(context).size;
    List<Book> bookList = [];
    DateFormat dateFormat = DateFormat("dd-MM-yyyy");

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kitap Ekle'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: _size.height * 0.05, horizontal: _size.width * 0.1),
        child: Column(
          children: [
            TextField(
              controller: _bookController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Kitap Adı',
              ),
            ),
            SizedBox(height: _size.height * 0.02),
            TextField(
              controller: _authorController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Yazar',
              ),
            ),
            SizedBox(height: _size.height * 0.02),
            TextField(
              controller: _pageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Sayfa Sayısı',
              ),
            ),
            SizedBox(height: _size.height * 0.02),
            TextField(
              controller: _timeController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Bitirme Tarihi',
              ),
            ),
            SizedBox(height: _size.height * 0.03),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Book book = Book(
                      bookName: _bookController.text,
                      author: _authorController.text,
                      pageNumber: int.parse(_pageController.text),
                      time: dateFormat.format(DateTime.now()),
                    );

                    bookList.add(book);
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(
                        bookList: bookList,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: _size.width * 0.015,
                    vertical: _size.height * 0.02,
                  ),
                  child: const Text(
                    'Kitap Ekle',
                    style: TextStyle(fontSize: 16),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
