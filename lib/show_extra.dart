import 'package:flutter/material.dart';

class ShowExtra extends StatelessWidget {
  const ShowExtra(this.path, {super.key});

  final String path;

  @override
  Widget build(BuildContext context) {
    return Image.asset(path);
  }
}
