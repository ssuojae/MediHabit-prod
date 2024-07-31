import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:medihabit/firebase_options.dart';
import 'package:medihabit/init_dependencies.dart';
import 'package:medihabit/presentation/login_scene/view/loginview.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();
  runApp(const MyApp());
}

final class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
      return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        textTheme: GoogleFonts.juaTextTheme(),
      ),
      home: Scaffold(
        body: Center(
          child: getIt<LoginView>(),
        ),
      ),
    );
  }
}