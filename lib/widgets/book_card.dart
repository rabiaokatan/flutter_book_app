import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Container(
          width: _size.width * 0.95,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "Kitap İsmi: ",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70),
                    ),
                    SizedBox(width: _size.width * 0.005),
                    Text(
                      "Oblomov",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      "Yazar: ",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70),
                    ),
                    Text(
                      "Ivan Gonçarov",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      "Sayfa Sayısı: ",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70),
                    ),
                    Text(
                      "700",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      "Bitirme Tarihi: ",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70),
                    ),
                    Text(
                      "19.01.2022",
                      style: TextStyle(fontSize: 18, color: Colors.white),
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
}
