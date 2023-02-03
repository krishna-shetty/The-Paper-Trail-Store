import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'log_in.dart';
import 'sign_in_loading.dart';
import 'create_account.dart';

class StartPage extends StatefulWidget {
  static String id = '/';
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0E9E0),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'MMXXII',
                    style: TextStyle(color: Color(0xFF2C1810), fontSize: 16),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Printed and bound in India',
                    style: TextStyle(fontSize: 10, color: Color(0xFF2C1810)),
                  ),
                  // Text(
                  //   'Python Mini-Project Ltd., Navi-Mumbai',
                  //   style: TextStyle(fontSize: 10, color: Color(0xFF2C1810)),
                  // ),
                ],
              ),
              AnimatedTextKit(animatedTexts: [
                TypewriterAnimatedText('The Paper Trail',
                    textStyle: const TextStyle(
                        fontSize: 100, color: Color(0xFF2C1810)),
                    speed: const Duration(milliseconds: 250))
              ]),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white, onPrimary: Colors.white),
                    onPressed: () {
                      Navigator.pushNamed(context, LogIn.id);
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
                          style:
                              TextStyle(color: Color(0xFF2C1810), fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 15.0),
                          child: const Divider(
                            thickness: 0.5,
                            color: Color(0xFF2C1810),
                            height: 50,
                          ),
                        ),
                      ),
                      const Text(
                        "OR",
                        style: TextStyle(color: Color(0xFF2C1810)),
                      ),
                      Expanded(
                        child: Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 15.0),
                            child: const Divider(
                              thickness: 0.5,
                              color: Color(0xFF2C1810),
                              height: 50,
                            )),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFDAAA63),
                      onPrimary: const Color(0xFFDAAA63),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, CreateAccount.id);
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
                          'Create account',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
