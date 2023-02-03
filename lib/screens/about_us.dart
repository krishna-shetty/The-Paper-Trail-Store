import 'package:flutter/material.dart';
import 'settings.dart';

class AboutUs extends StatefulWidget {
  static String id = '/about_us';
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFF2C1810)),
        elevation: 0,
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
        title: const Center(
          child: Text(
            'The Paper Trail',
            style: TextStyle(
              color: Color(0xFF2C1810),
              fontSize: 20,
            ),
          ),
        ),
        backgroundColor: const Color(0xFFF0E9E0),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xFFF0E9E0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: const [
                            Text(
                              'Krishna Shetty',
                              style: TextStyle(
                                color: Color(0xFF2C1810),
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '<Full Stack Developer/>',
                              style: TextStyle(
                                color: Color(0xFF6b5d58),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              'Mayank Shetty',
                              style: TextStyle(
                                color: Color(0xFF2C1810),
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '<Full Stack Developer/>',
                              style: TextStyle(
                                color: Color(0xFF6b5d58),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              'Nishant Rajadhyaksha',
                              style: TextStyle(
                                color: Color(0xFF2C1810),
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '<Back-end Developer/>',
                              style: TextStyle(
                                color: Color(0xFF6b5d58),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
