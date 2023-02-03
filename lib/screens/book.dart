import 'package:flutter/material.dart';

class Book extends StatelessWidget {
  final String bookAuthor;
  final String bookTitle;
  final String bookPublisher;
  final int bookYearOfPublication;
  const Book(
      {required this.bookAuthor,
      required this.bookTitle,
      required this.bookPublisher,
      required this.bookYearOfPublication});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        color: const Color(0xFF757575),
        child: Container(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bookTitle,
                  style: const TextStyle(fontSize: 30.0),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  bookAuthor,
                  style: const TextStyle(
                      fontSize: 16.0, color: Colors.grey, fontFamily: 'Lato'),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  bookPublisher,
                  style: const TextStyle(
                      fontSize: 16.0, color: Colors.grey, fontFamily: 'Lato'),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '$bookYearOfPublication',
                  style: const TextStyle(
                      fontSize: 16.0, color: Colors.grey, fontFamily: 'Lato'),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFF757575)),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0))),
        ),
      ),
    );
  }
}
