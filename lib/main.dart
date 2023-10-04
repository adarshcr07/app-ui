import 'package:first_app_ui/view_model/loginpageprovider.dart';
//import 'package:first_app_ui/view/homepage.dart';
import 'package:first_app_ui/view/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginpageProvider(),
      child: MaterialApp(
        title: 'First app',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: Loginpage(),
      ),
    );
  }
}
