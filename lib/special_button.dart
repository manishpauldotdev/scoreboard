import 'package:flutter/material.dart';

class SpecialButton extends StatelessWidget {
  const SpecialButton(this.action, this.event, this.wicket, {super.key});

  final void Function() action;
  final String event;
  final int wicket;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 50,
      margin: const EdgeInsets.all(2.5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
        ),
        onPressed: wicket < 10 ? () => action() : null,
        child: Text(
          event,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
