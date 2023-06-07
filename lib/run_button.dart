import 'package:flutter/material.dart';

class RunButton extends StatelessWidget {
  const RunButton(this.addRuns, this.run, this.wicket, {super.key});

  final void Function(int) addRuns;
  final int run;
  final int wicket;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 50,
      margin: const EdgeInsets.all(2.5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 253, 117, 68),
        ),
        onPressed: wicket < 10 ? () => addRuns(run) : null,
        child: Text(
          run.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
