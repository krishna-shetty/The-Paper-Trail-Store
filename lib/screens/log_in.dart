import 'package:flutter/material.dart';
import 'sign_in_loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LogIn extends StatefulWidget {
  static String id = '/log_in';
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  bool _isLoading = false;
  var error = '';
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
              'Welcome back',
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
                primary: Colors.white,
                onPrimary: Colors.white,
              ),
              onPressed: () async {
                setState(() {
                  _isLoading = true;
                });
                try {
                  print("Finding user");
                  final user = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  print("Found");
                  if (user != null) {
                    print("Entered if");
                    var docSnapshot = await _firestore
                        .collection('user_details')
                        .doc(email)
                        .get();
                    if (docSnapshot.exists) {
                      Map<String, dynamic> data = docSnapshot.data()!;
                      print("Got user details!");

                      var bookSnapshot = await _firestore
                          .collection('discover_books')
                          .doc(email)
                          .get();
                      if (bookSnapshot.exists) {
                        Map<String, dynamic> bookData = bookSnapshot.data()!;
                        print("Got New and Trending");

                        var newBookSnapshot = await _firestore
                            .collection('discover_books')
                            .doc('new_and_trending')
                            .get();
                        print("Got Discover Books");
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
                                name: data['name'],
                                age: data['age'],
                                location: data['location'],
                                bookData: bookData,
                                newBookData: newBookData,
                              ),
                            ),
                          );
                        }
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    }
                  }
                } catch (e) {
                  setState(() {
                    error = e.toString();
                    setState(() {
                      _isLoading = false;
                    });
                  });
                }
              },
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.all(
                    Radius.circular(1),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Log In',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF2C1810), fontSize: 14),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Color(0xFFF0E9E0),
                      color: Colors.white,
                    ),
                  )
                : const Text('')
          ],
        ),
      ),
    );
  }
}
