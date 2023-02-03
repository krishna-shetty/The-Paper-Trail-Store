import 'package:flutter/material.dart';
import 'package:the_paper_trail_store/screens/create_account.dart';
import 'screens/start_page.dart';
import 'screens/about_us.dart';
import 'screens/log_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      initialRoute: '/',
      theme: ThemeData(fontFamily: 'Libre Caslon'),
      routes: {
        StartPage.id: (context) => const StartPage(),
        AboutUs.id: (context) => const AboutUs(),
        LogIn.id: (context) => const LogIn(),
        CreateAccount.id: (context) => const CreateAccount()
      },
    );
  }
}
