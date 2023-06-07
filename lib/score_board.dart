import 'package:flutter/material.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard(this.score, this.wicket, this.over, {super.key});

  final int score;
  final int wicket;
  final double over;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 250,
      child: Card(
        color: const Color.fromARGB(221, 134, 118, 253),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              wicket < 10
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$score',
                          style: const TextStyle(
                            color: Color.fromARGB(232, 233, 233, 233),
                            fontSize: 96,
                          ),
                        ),
                        const Text(
                          '/',
                          style: TextStyle(
                            color: Color.fromARGB(232, 233, 233, 233),
                            fontSize: 96,
                          ),
                        ),
                        Text(
                          '$wicket',
                          style: const TextStyle(
                            color: Color.fromARGB(232, 233, 233, 233),
                            fontSize: 96,
                          ),
                        ),
                      ],
                    )
                  : Text(
                      '$score',
                      style: const TextStyle(
                        color: Color.fromARGB(232, 233, 233, 233),
                        fontSize: 96,
                      ),
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Over:',
                    style: TextStyle(
                      color: Color.fromARGB(232, 233, 233, 233),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    over.toStringAsFixed(1),
                    style: const TextStyle(
                      color: Color.fromARGB(232, 233, 233, 233),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
