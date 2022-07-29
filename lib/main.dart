import 'package:flutter/material.dart';
import 'package:gpa/screens/blank_page.dart';
import 'package:gpa/screens/padlock_screen.dart';
import 'package:gpa/screens/shuffled_numbers_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: ShuffledNumbers.id,
      routes: {
        BlankPage.id: (context) => const BlankPage(),
        PadlockScreen.id: (context) => const PadlockScreen(),
        ShuffledNumbers.id: (context)=> const ShuffledNumbers(),
      },
    );
  }
}
