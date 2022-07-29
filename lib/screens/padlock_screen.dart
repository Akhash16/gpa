import 'package:flutter/material.dart';
import 'package:pattern_lock/pattern_lock.dart';

class PadlockScreen extends StatefulWidget {
  const PadlockScreen({Key? key}) : super(key: key);

  static const String id = 'padlock_screen';

  @override
  State<PadlockScreen> createState() => _PadlockScreenState();
}

class _PadlockScreenState extends State<PadlockScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PatternLock(
        selectedColor: Colors.purple, 
        notSelectedColor: Colors.black26,
        dimension: 7,
        pointRadius: 10,
        fillPoints: true,
        onInputComplete: (List<int> input) {
          if (input.length < 4) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "At least 4 points required",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            );
            return;
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("pattern is " + input.toString()),
            ),
          );
        },
      ),
    );
  }
}
