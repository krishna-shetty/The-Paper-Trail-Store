import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'start_page.dart';
import 'book.dart';
import 'settings.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  final String name;
  final int age;
  final String location;
  final bookData;
  final newBookData;
  const HomePage(
      {required this.name,
      required this.age,
      required this.location,
      required this.bookData,
      required this.newBookData});

  @override
  State<HomePage> createState() => _HomePageState(
      name: name,
      age: age,
      location: location,
      bookData: bookData,
      newBookData: newBookData);
}

class _HomePageState extends State<HomePage> {
  final String name;
  final int age;
  final String location;
  final bookData;
  final newBookData;
  _HomePageState(
      {required this.name,
      required this.age,
      required this.location,
      required this.bookData,
      required this.newBookData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFDAAA63),
        body: LibraryPage(
            name: name,
            age: age,
            location: location,
            bookData: bookData,
            newBookData: newBookData));
  }
}

class LibraryPage extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  final String name;
  final int age;
  final String location;
  final bookData;
  final newBookData;
  LibraryPage(
      {required this.name,
      required this.age,
      required this.location,
      required this.bookData,
      required this.newBookData});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFDAAA63),
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFF0E9E0),
                ),
                child: SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.book_sharp,
                                color: Color(0xFF2C1810), size: 50),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                MaterialButton(
                                  minWidth: 0,
                                  height: 0,
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SettingsPage(
                                            name: name,
                                            age: age,
                                            location: location),
                                      ),
                                    );
                                  },
                                  child: Icon(Icons.settings),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Hero(
                                  tag: 'avatar',
                                  child: MaterialButton(
                                    minWidth: 0,
                                    height: 0,
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      _auth.signOut();
                                      Navigator.pushNamed(
                                          context, StartPage.id);
                                    },
                                    child: const CircleAvatar(
                                      radius: 22.0,
                                      backgroundImage:
                                          AssetImage('images/profile_pic.jpg'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'Age: $age, Location: $location',
                                  style: const TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 16,
                                      color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(0.0),
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFF0E9E0),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 25,
                            ),
                            const Text(
                              'Discover Books',
                              style: TextStyle(
                                  fontSize: 25, color: Color(0xFF2C1810)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 200,
                              child: CarouselSlider(
                                items: [
                                  BookPlaceholder(
                                    bookAuthor: bookData['author_0'],
                                    bookTitle: bookData['title_0'],
                                    bookImg: bookData['img_0'],
                                    bookPublisher: bookData['publisher_1'],
                                    bookYearOfPublication: bookData[
                                                    'year_of_publication_0']
                                                .runtimeType ==
                                            String
                                        ? int.parse(
                                            bookData['year_of_publication_0'])
                                        : bookData['year_of_publication_0'],
                                  ),
                                  BookPlaceholder(
                                    bookAuthor: bookData['author_1'],
                                    bookTitle: bookData['title_1'],
                                    bookImg: bookData['img_1'],
                                    bookPublisher: bookData['publisher_1'],
                                    bookYearOfPublication: bookData[
                                                    'year_of_publication_1']
                                                .runtimeType ==
                                            String
                                        ? int.parse(
                                            bookData['year_of_publication_1'])
                                        : bookData['year_of_publication_1'],
                                  ),
                                  BookPlaceholder(
                                    bookAuthor: bookData['author_2'],
                                    bookTitle: bookData['title_2'],
                                    bookImg: bookData['img_2'],
                                    bookPublisher: bookData['publisher_2'],
                                    bookYearOfPublication: bookData[
                                                    'year_of_publication_2']
                                                .runtimeType ==
                                            String
                                        ? int.parse(
                                            bookData['year_of_publication_2'])
                                        : bookData['year_of_publication_2'],
                                  ),
                                  BookPlaceholder(
                                    bookAuthor: bookData['author_3'],
                                    bookTitle: bookData['title_3'],
                                    bookImg: bookData['img_3'],
                                    bookPublisher: bookData['publisher_3'],
                                    bookYearOfPublication: bookData[
                                                    'year_of_publication_3']
                                                .runtimeType ==
                                            String
                                        ? int.parse(
                                            bookData['year_of_publication_3'])
                                        : bookData['year_of_publication_3'],
                                  ),
                                  BookPlaceholder(
                                    bookAuthor: bookData['author_4'],
                                    bookTitle: bookData['title_4'],
                                    bookImg: bookData['img_4'],
                                    bookPublisher: bookData['publisher_4'],
                                    bookYearOfPublication: bookData[
                                                    'year_of_publication_4']
                                                .runtimeType ==
                                            String
                                        ? int.parse(
                                            bookData['year_of_publication_4'])
                                        : bookData['year_of_publication_4'],
                                  ),
                                  BookPlaceholder(
                                    bookAuthor: bookData['author_5'],
                                    bookTitle: bookData['title_5'],
                                    bookImg: bookData['img_5'],
                                    bookPublisher: bookData['publisher_5'],
                                    bookYearOfPublication: bookData[
                                                    'year_of_publication_5']
                                                .runtimeType ==
                                            String
                                        ? int.parse(
                                            bookData['year_of_publication_5'])
                                        : bookData['year_of_publication_5'],
                                  ),
                                  BookPlaceholder(
                                    bookAuthor: bookData['author_6'],
                                    bookTitle: bookData['title_6'],
                                    bookImg: bookData['img_6'],
                                    bookPublisher: bookData['publisher_6'],
                                    bookYearOfPublication: bookData[
                                                    'year_of_publication_6']
                                                .runtimeType ==
                                            String
                                        ? int.parse(
                                            bookData['year_of_publication_6'])
                                        : bookData['year_of_publication_6'],
                                  ),
                                  BookPlaceholder(
                                    bookAuthor: bookData['author_7'],
                                    bookTitle: bookData['title_7'],
                                    bookImg: bookData['img_7'],
                                    bookPublisher: bookData['publisher_7'],
                                    bookYearOfPublication: bookData[
                                                    'year_of_publication_7']
                                                .runtimeType ==
                                            String
                                        ? int.parse(
                                            bookData['year_of_publication_7'])
                                        : bookData['year_of_publication_7'],
                                  ),
                                  BookPlaceholder(
                                    bookAuthor: bookData['author_8'],
                                    bookTitle: bookData['title_8'],
                                    bookImg: bookData['img_8'],
                                    bookPublisher: bookData['publisher_8'],
                                    bookYearOfPublication: bookData[
                                                    'year_of_publication_8']
                                                .runtimeType ==
                                            String
                                        ? int.parse(
                                            bookData['year_of_publication_8'])
                                        : bookData['year_of_publication_8'],
                                  ),
                                  BookPlaceholder(
                                    bookAuthor: bookData['author_9'],
                                    bookTitle: bookData['title_9'],
                                    bookImg: bookData['img_9'],
                                    bookPublisher: bookData['publisher_9'],
                                    bookYearOfPublication: bookData[
                                                    'year_of_publication_9']
                                                .runtimeType ==
                                            String
                                        ? int.parse(
                                            bookData['year_of_publication_9'])
                                        : bookData['year_of_publication_9'],
                                  ),
                                ],
                                options: CarouselOptions(
                                  height: 400,
                                  aspectRatio: 125 / 400,
                                  viewportFraction: 0.42,
                                  initialPage: 0,
                                  enableInfiniteScroll: false,
                                  reverse: false,
                                  autoPlay: false,
                                  autoPlayInterval: const Duration(seconds: 1),
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  scrollDirection: Axis.horizontal,
                                  pageSnapping: true,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SectionPlaceholder(
                        newBookData: newBookData,
                        title: 'New & Trending',
                        axisDirection: Axis.horizontal),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionPlaceholder extends StatelessWidget {
  final String title;
  final Axis axisDirection;
  final newBookData;
  const SectionPlaceholder(
      {required this.newBookData,
      required this.title,
      required this.axisDirection});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 25, color: Color(0xFF2C1810)),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: axisDirection,
                children: [
                  BookPlaceholder(
                    bookAuthor: newBookData['author_0'],
                    bookTitle: newBookData['title_0'],
                    bookImg: newBookData['img_0'],
                    bookPublisher: newBookData['publisher_1'],
                    bookYearOfPublication:
                        newBookData['year_of_publication_0'].runtimeType ==
                                String
                            ? int.parse(newBookData['year_of_publication_0'])
                            : newBookData['year_of_publication_0'],
                  ),
                  BookPlaceholder(
                    bookAuthor: newBookData['author_1'],
                    bookTitle: newBookData['title_1'],
                    bookImg: newBookData['img_1'],
                    bookPublisher: newBookData['publisher_1'],
                    bookYearOfPublication:
                        newBookData['year_of_publication_1'].runtimeType ==
                                String
                            ? int.parse(newBookData['year_of_publication_1'])
                            : newBookData['year_of_publication_1'],
                  ),
                  BookPlaceholder(
                    bookAuthor: newBookData['author_2'],
                    bookTitle: newBookData['title_2'],
                    bookImg: newBookData['img_2'],
                    bookPublisher: newBookData['publisher_2'],
                    bookYearOfPublication:
                        newBookData['year_of_publication_2'].runtimeType ==
                                String
                            ? int.parse(newBookData['year_of_publication_2'])
                            : newBookData['year_of_publication_2'],
                  ),
                  BookPlaceholder(
                    bookAuthor: newBookData['author_3'],
                    bookTitle: newBookData['title_3'],
                    bookImg: newBookData['img_3'],
                    bookPublisher: newBookData['publisher_3'],
                    bookYearOfPublication:
                        newBookData['year_of_publication_3'].runtimeType ==
                                String
                            ? int.parse(newBookData['year_of_publication_3'])
                            : newBookData['year_of_publication_3'],
                  ),
                  BookPlaceholder(
                    bookAuthor: newBookData['author_4'],
                    bookTitle: newBookData['title_4'],
                    bookImg: newBookData['img_4'],
                    bookPublisher: newBookData['publisher_4'],
                    bookYearOfPublication:
                        newBookData['year_of_publication_4'].runtimeType ==
                                String
                            ? int.parse(newBookData['year_of_publication_4'])
                            : newBookData['year_of_publication_4'],
                  ),
                  BookPlaceholder(
                    bookAuthor: newBookData['author_5'],
                    bookTitle: newBookData['title_5'],
                    bookImg: newBookData['img_5'],
                    bookPublisher: newBookData['publisher_5'],
                    bookYearOfPublication:
                        newBookData['year_of_publication_5'].runtimeType ==
                                String
                            ? int.parse(newBookData['year_of_publication_5'])
                            : newBookData['year_of_publication_5'],
                  ),
                  BookPlaceholder(
                    bookAuthor: newBookData['author_6'],
                    bookTitle: newBookData['title_6'],
                    bookImg: newBookData['img_6'],
                    bookPublisher: newBookData['publisher_6'],
                    bookYearOfPublication:
                        newBookData['year_of_publication_6'].runtimeType ==
                                String
                            ? int.parse(newBookData['year_of_publication_6'])
                            : newBookData['year_of_publication_6'],
                  ),
                  BookPlaceholder(
                    bookAuthor: newBookData['author_7'],
                    bookTitle: newBookData['title_7'],
                    bookImg: newBookData['img_7'],
                    bookPublisher: newBookData['publisher_7'],
                    bookYearOfPublication:
                        newBookData['year_of_publication_7'].runtimeType ==
                                String
                            ? int.parse(newBookData['year_of_publication_7'])
                            : newBookData['year_of_publication_7'],
                  ),
                  BookPlaceholder(
                    bookAuthor: newBookData['author_8'],
                    bookTitle: newBookData['title_8'],
                    bookImg: newBookData['img_8'],
                    bookPublisher: newBookData['publisher_8'],
                    bookYearOfPublication:
                        newBookData['year_of_publication_8'].runtimeType ==
                                String
                            ? int.parse(newBookData['year_of_publication_8'])
                            : newBookData['year_of_publication_8'],
                  ),
                  BookPlaceholder(
                    bookAuthor: newBookData['author_9'],
                    bookTitle: newBookData['title_9'],
                    bookImg: newBookData['img_9'],
                    bookPublisher: newBookData['publisher_9'],
                    bookYearOfPublication:
                        newBookData['year_of_publication_9'].runtimeType ==
                                String
                            ? int.parse(newBookData['year_of_publication_9'])
                            : newBookData['year_of_publication_9'],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class BookPlaceholder extends StatelessWidget {
  final String bookAuthor;
  final String bookTitle;
  final String bookImg;
  final String bookPublisher;
  final int bookYearOfPublication;
  const BookPlaceholder(
      {required this.bookAuthor,
      required this.bookTitle,
      required this.bookImg,
      required this.bookPublisher,
      required this.bookYearOfPublication});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 0,
      height: 0,
      padding: EdgeInsets.zero,
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) => SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Book(
                bookAuthor: bookAuthor,
                bookPublisher: bookPublisher,
                bookTitle: bookTitle,
                bookYearOfPublication: bookYearOfPublication,
              ),
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Container(
          child: Image.network(bookImg),
          width: 125,
        ),
      ),
    );
  }
}
