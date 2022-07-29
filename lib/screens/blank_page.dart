import 'package:flutter/material.dart';

class BlankPage extends StatefulWidget {
  const BlankPage({Key? key}) : super(key: key);

  static const String id = 'blank_page';

  @override
  State<BlankPage> createState() => _BlankPageState();
}

class _BlankPageState extends State<BlankPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
