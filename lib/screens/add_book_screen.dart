import 'package:flutter/material.dart';
import 'package:flutter_book_app/db/book_db.dart';
import 'package:flutter_book_app/models/book.dart';
import 'package:flutter_book_app/screens/home_screen.dart';

class AddBookScreen extends StatefulWidget {
  final Book? book;
  const AddBookScreen({Key? key, this.book}) : super(key: key);

  @override
  State<AddBookScreen> createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  final TextEditingController _bookController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _pageController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  bool isLoading = false;

  late String bookName;
  late String author;
  late int pageNumber;
  late String time;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    bookName=widget.book?.bookName ?? '';
    author=widget.book?.author ?? '';
    pageNumber=widget.book?.pageNumber ?? 0;
    time=widget.book?.time ?? '';

    // if (widget.book!.bookName.isNotEmpty) {
    //   Book book = widget.book!;
    //   _bookController.text = book.bookName;
    //   _authorController.text = book.author;
    //   _pageController.text = book.pageNumber.toString();
    //   _timeController.text = book.time;
    // }
  }

  
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    DateTime? _dateTime;

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
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2018),
                  lastDate: DateTime(2025),
                ).then((date) {
                  setState(() {
                    _dateTime = date;
                    _timeController.text =
                        '${_dateTime!.day}/${_dateTime!.month}/${_dateTime!.year}';
                  });
                });
              },
              controller: _timeController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: _dateTime == null
                    ? 'Bitirme Tarihi'
                    : '${_dateTime!.day}/${_dateTime!.month}/${_dateTime!.year}',
              ),
            ),
            SizedBox(height: _size.height * 0.03),
            ElevatedButton(
                onPressed: () {
                  addBook();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                    (Route<dynamic> route) => false,
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

  Future addBook() async {
    final book = Book(
      bookName: _bookController.text,
      author: _authorController.text,
      pageNumber: int.parse(_pageController.text),
      time: _timeController.text,
    );

    await BookDatabase.instance.create(book);
  }
}
