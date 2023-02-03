import 'package:flutter/material.dart';
import 'start_page.dart';
import 'about_us.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io' show Platform;

class SettingsPage extends StatefulWidget {
  final String name;
  final int age;
  final String location;
  const SettingsPage(
      {required this.name, required this.age, required this.location});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _auth = FirebaseAuth.instance;
  late var loggedInUserEmail;

  void getUserEmail() {
    var user = _auth.currentUser;
    if (user != null) {
      loggedInUserEmail = user.email;
    } else {
      loggedInUserEmail = "";
    }
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  openWhatsapp() async {
    var whatsApp = "+919223227905";
    var whatsAppURl_android = "whatsapp://send?phone=" + whatsApp + "&text=";
    var whatappURL_ios = "https://wa.me/$whatsApp?text=${Uri.parse("")}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURL_ios)) {
        await launch(whatappURL_ios, forceSafariVC: false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("WhatsApp not installed!")));
      }
    } else {
      // android , web
      if (await canLaunch(whatsAppURl_android)) {
        await launch(whatsAppURl_android);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("WhatsApp not installed!")));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getUserEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        backgroundColor: const Color(0xFFF0E9E0),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Settings',
                    style: TextStyle(fontSize: 50, color: Color(0xFF2C1810)),
                  ),
                ),
                const Center(
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('images/profile_pic.jpg'),
                  ),
                ),
                Center(
                  child: Text(
                    '${widget.name}',
                    style:
                        const TextStyle(fontSize: 25, color: Color(0xFF2C1810)),
                  ),
                ),
                Center(
                  child: Text(
                    '$loggedInUserEmail',
                    style:
                        const TextStyle(fontSize: 16, color: Color(0xFF2C1810)),
                  ),
                ),
                const Divider(
                  color: Color(0xFFA58F71),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AboutUs.id);
                  },
                  style: TextButton.styleFrom(primary: const Color(0xFFA58F71)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'About Us',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF2C1810),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Color(0xFF2C1810),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () => _launchURL('https:paypal.me/shettykrishna'),
                  style: TextButton.styleFrom(primary: const Color(0xFFA58F71)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Donate A Coffee',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF2C1810),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Color(0xFF2C1810),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () => {openWhatsapp()},
                  style: TextButton.styleFrom(primary: const Color(0xFFA58F71)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Support/Updates',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF2C1810),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Color(0xFF2C1810),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () =>
                      _launchURL('mailto:krishna.shetty@somaiya.edu'),
                  style: TextButton.styleFrom(primary: const Color(0xFFA58F71)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Email Us',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF2C1810),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Color(0xFF2C1810),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Color(0xFFA58F71),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFA58F71),
                    onPrimary: const Color(0xFFA58F71),
                  ),
                  onPressed: () {
                    _auth.signOut();
                    Navigator.pushNamed(context, StartPage.id);
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFFA58F71),
                      borderRadius: BorderRadius.all(
                        Radius.circular(1),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Log Out',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    'App Version - 1.00.0',
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFF2C1810),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
