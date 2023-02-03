import 'package:flutter/material.dart';
import 'package:the_paper_trail_store/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class SignInLoading extends StatefulWidget {
  final String name;
  final int age;
  final String location;
  final bookData;
  final newBookData;

  const SignInLoading(
      {required this.name,
      required this.age,
      required this.location,
      required this.bookData,
      required this.newBookData});

  @override
  State<SignInLoading> createState() => _SignInLoadingState();
}

class _SignInLoadingState extends State<SignInLoading> {
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 2);
    return new Timer(duration, route);
  }

  route() async {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(seconds: 2),
        pageBuilder: (_, __, ___) => HomePage(
          name: widget.name,
          age: widget.age,
          location: widget.location,
          bookData: widget.bookData,
          newBookData: widget.newBookData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          color: const Color(0xFFF0E9E0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Hero(
              tag: 'avatar',
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/profile_pic.jpg'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Welcome, ${widget.name}!',
              style: const TextStyle(color: Color(0xFF2C1810), fontSize: 25),
            )
          ])),
    );
  }
}
