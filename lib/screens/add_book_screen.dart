import 'package:flutter/material.dart';
import 'package:flutter_book_app/db/book_db.dart';
import 'package:flutter_book_app/models/book.dart';
import 'package:flutter_book_app/screens/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddBookScreen extends StatefulWidget {
  final Book? book;
  final bool isPressed;
  const AddBookScreen({
    Key? key,
    this.book,
    this.isPressed = false,
  }) : super(key: key);

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
    super.initState();

    bookName = widget.book?.bookName ?? '';
    author = widget.book?.author ?? '';
    pageNumber = widget.book?.pageNumber ?? 0;
    time = widget.book?.time ?? '';

    if (widget.isPressed) {
      Book book = widget.book!;
      _bookController.text = book.bookName;
      _authorController.text = book.author;
      _pageController.text = book.pageNumber.toString();
      _timeController.text = book.time;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    DateTime? _dateTime;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isPressed
              ? AppLocalizations.of(context)!.edit
              : AppLocalizations.of(context)!.add_book,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: _size.height * 0.05, horizontal: _size.width * 0.1),
          child: Column(
            children: [
              TextField(
                controller: _bookController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: AppLocalizations.of(context)!.book_name,
                ),
              ),
              SizedBox(height: _size.height * 0.02),
              TextField(
                controller: _authorController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: AppLocalizations.of(context)!.author,
                ),
              ),
              SizedBox(height: _size.height * 0.02),
              TextField(
                controller: _pageController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: AppLocalizations.of(context)!.pages,
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
                      ? AppLocalizations.of(context)!.finish_date
                      : '${_dateTime!.day}/${_dateTime!.month}/${_dateTime!.year}',
                ),
              ),
              SizedBox(height: _size.height * 0.03),
              ElevatedButton(
                  onPressed: () {
                    widget.isPressed ? updateBook() : addBook();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: _size.width * 0.015,
                      vertical: _size.height * 0.02,
                    ),
                    child: Text(
                      widget.isPressed
                          ? AppLocalizations.of(context)!.edit
                          : AppLocalizations.of(context)!.add_book,
                      style: const TextStyle(fontSize: 16),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Future updateBook() async {
    final note = widget.book!.copy(
      bookName: _bookController.text,
      author: _authorController.text,
      pageNumber: int.parse(_pageController.text),
      time: _timeController.text,
    );
    await BookDatabase.instance.update(note);
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
