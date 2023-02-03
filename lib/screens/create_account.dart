import 'dart:convert';

import 'package:flutter/material.dart';
import 'sign_in_loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class CreateAccount extends StatefulWidget {
  static String id = '/create_account';
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  bool _isLoading = false;
  String error = "";
  String name = "User";
  int age = 20;
  String location = "Navi Mumbai";
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF0E9E0),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create an account',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30,
                color: Color(0xFF2C1810),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: TextField(
                onChanged: (value) {
                  name = value;
                },
                cursorColor: const Color(0xFF2C1810),
                textAlign: TextAlign.left,
                decoration: const InputDecoration(
                  hintText: 'Enter your name',
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF2C1810), width: 1.25),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                onChanged: (value) {
                  age = int.parse(value);
                },
                cursorColor: const Color(0xFF2C1810),
                textAlign: TextAlign.left,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter your age',
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF2C1810), width: 1.25),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                onChanged: (value) {
                  location = value;
                },
                cursorColor: const Color(0xFF2C1810),
                textAlign: TextAlign.left,
                decoration: const InputDecoration(
                  hintText: 'Enter your location',
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF2C1810), width: 1.25),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                onChanged: (value) {
                  email = value;
                },
                cursorColor: const Color(0xFF2C1810),
                textAlign: TextAlign.left,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF2C1810), width: 1.25),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                onChanged: (value) {
                  password = value;
                },
                cursorColor: const Color(0xFF2C1810),
                textAlign: TextAlign.left,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF2C1810), width: 1.25),
                  ),
                ),
              ),
            ),
            Padding(
              padding: error == ''
                  ? EdgeInsets.only(top: 0)
                  : EdgeInsets.only(top: 24.0),
              child: Text('${error}', style: TextStyle(color: Colors.red)),
            ),
            const SizedBox(
              height: 24.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFDAAA63),
                onPrimary: const Color(0xFFDAAA63),
              ),
              onPressed: () async {
                setState(() {
                  _isLoading = true;
                  error = "";
                });
                try {
                  var response = await http.get(Uri.parse(
                      'https://mysterious-caverns-27484.herokuapp.com/predict?location=$age&age=$location'));
                  var data;
                  if (response.statusCode == 200) {
                    data = response.body;
                  } else {
                    error = response.statusCode.toString();
                  }

                  List title = ["", "", "", "", "", "", "", "", "", ""];
                  List author = ["", "", "", "", "", "", "", "", "", ""];
                  List year_of_publication = [
                    -1,
                    -1,
                    -1,
                    -1,
                    -1,
                    -1,
                    -1,
                    -1,
                    -1,
                    -1
                  ];
                  List publisher = ["", "", "", "", "", "", "", "", "", ""];
                  List img = ["", "", "", "", "", "", "", "", "", ""];

                  for (int i = 0; i < 10; i++) {
                    title[i] = (jsonDecode(data)['$i']['Book-Title'])[0] != null
                        ? (jsonDecode(data)['$i']['Book-Title'])[0]
                        : "Unable to get";
                    author[i] =
                        (jsonDecode(data)['$i']['Book-Author'])[0] != null
                            ? (jsonDecode(data)['$i']['Book-Author'])[0]
                            : "Unable to get";
                    year_of_publication[i] = (jsonDecode(data)['$i']
                                ['Year-Of-Publication'])[0] !=
                            null
                        ? (jsonDecode(data)['$i']['Year-Of-Publication'])[0]
                        : -1;
                    publisher[i] =
                        (jsonDecode(data)['$i']['Publisher'])[0] != null
                            ? (jsonDecode(data)['$i']['Publisher'])[0]
                            : "Unable to get";
                    img[i] = (jsonDecode(data)['$i']['Image-URL-L'])[0] != null
                        ? (jsonDecode(data)['$i']['Image-URL-L'])[0]
                        : "https://leadershiftinsights.com/wp-content/a/2019/07/no-book-cover-available.jpg";
                  }

                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  if (newUser != null) {
                    final user = _auth.currentUser;
                    late var loggedInUser;
                    if (user != null) {
                      loggedInUser = user;
                    }

                    _firestore
                        .collection('user_details')
                        .doc(email)
                        .set({"name": name, "age": age, "location": location});

                    for (int i = 0; i < 10; i++) {
                      _firestore.collection('discover_books').doc(email).set({
                        "title_$i": title[i],
                        "author_$i": author[i],
                        "year_of_publication_$i": year_of_publication[i],
                        "publisher_$i": publisher[i],
                        "img_$i": img[i]
                      }, SetOptions(merge: true));
                    }

                    var bookSnapshot = await _firestore
                        .collection('discover_books')
                        .doc(email)
                        .get();
                    if (bookSnapshot.exists) {
                      Map<String, dynamic> bookData = bookSnapshot.data()!;

                      var newBookSnapshot = await _firestore
                          .collection('discover_books')
                          .doc('new_and_trending')
                          .get();
                      if (newBookSnapshot.exists) {
                        Map<String, dynamic> newBookData =
                            newBookSnapshot.data()!;
                        setState(() {
                          _isLoading = false;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInLoading(
                              name: name,
                              age: age,
                              location: location,
                              bookData: bookData,
                              newBookData: newBookData,
                            ),
                          ),
                        );
                      }
                    }
                  }
                } catch (e) {
                  error = e.toString();
                  setState(() {
                    _isLoading = false;
                  });
                }
              },
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFDAAA63),
                  borderRadius: BorderRadius.all(
                    Radius.circular(1),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _isLoading
                ? Center(
                    child: Column(
                      children: const [
                        CircularProgressIndicator(
                          backgroundColor: Color(0xFFF0E9E0),
                          color: Color(0xFFDAAA63),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Please wait. This might take a few minutes.',
                          style: TextStyle(color: Color(0xFF2C1810)),
                        ),
                      ],
                    ),
                  )
                : const Text('')
          ],
        ),
      ),
    );
  }
}
