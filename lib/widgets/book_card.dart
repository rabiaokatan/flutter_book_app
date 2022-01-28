import 'package:flutter/material.dart';
import 'package:flutter_book_app/db/book_db.dart';
import 'package:flutter_book_app/models/book.dart';
import 'package:flutter_book_app/screens/add_book_screen.dart';

class BookCard extends StatefulWidget {
  final int bookId;
  late Book book;
  BookCard({Key? key, required this.bookId, required this.book})
      : super(key: key);

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshBook();
  }

  Future refreshBook() async {
    setState(() => isLoading = true);

    widget.book = await BookDatabase.instance.readBookInfo(widget.bookId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: _size.height * 0.02),
        child: Container(
          width: _size.width * 0.95,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: _size.height * 0.015, horizontal: _size.width * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Kitap İsmi: ",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                        SizedBox(width: _size.width * 0.005),
                        Text(
                          widget.book.bookName,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Yazar: ",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                        Text(
                          widget.book.author,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Sayfa Sayısı: ",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                        Text(
                          "${widget.book.pageNumber}",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Bitirme Tarihi: ",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                        Text(
                          widget.book.time,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    //edit button
                    IconButton(
                      onPressed: () async {
                        if (isLoading) return;

                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddBookScreen(
                              isPressed: true,
                              book: widget.book,
                            ),
                          ),
                        );
                        refreshBook();
                      },
                      color: Theme.of(context).primaryColorDark,
                      icon: const Icon(Icons.edit),
                    ),
                    //clear button
                    IconButton(
                      onPressed: () {
                        _showDialog();
                      },
                      color: Theme.of(context).primaryColorDark,
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showDialog() {
    showDialog(
      context: context,
      //barrierDismissible: false, //sadece butonlara basınca ekrandan çıkıyor
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: const Text("Silmek istediğinize emin misiniz?"),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: TextButton(
                child: const Text(
                  'Evet',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () async {
                  await BookDatabase.instance.delete(widget.bookId);
                  Navigator.of(context).pop();
                },
              ),
            ),
            TextButton(
              child: const Text(
                'Hayır',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
