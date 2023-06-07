import 'package:flutter/material.dart';

import 'package:mini_cricket_app/score_board.dart';
import 'package:mini_cricket_app/special_button.dart';
import 'package:mini_cricket_app/run_button.dart';
import 'package:mini_cricket_app/show_extra.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int score = 0;
  int wicket = 0;
  double over = 0.0;
  bool isExtra = false;
  bool isOut = false;
  String path = '';

  void countOver() {
    setState(() {
      over += 0.1;
      if (over > (over.toInt() + 0.5)) {
        over += 0.4;
      }
    });
  }

  void addRuns(int runs) {
    setState(() {
      score += runs;
      isExtra = false;
    });
    countOver();
  }

  void addWicket() {
    setState(() {
      wicket++;
      if (wicket == 10) {
        isExtra = false;
        return;
      }
      isExtra = true;
      path = 'assets/extras/out.png';
    });
    countOver();
  }

  void showWide() {
    setState(() {
      score++;
      isExtra = true;
      path = 'assets/extras/wide.png';
    });
  }

  void showNoBall() {
    setState(() {
      score++;
      isExtra = true;
      path = 'assets/extras/free-hit.png';
    });
  }

  void reset() {
    setState(() {
      score = 0;
      wicket = 0;
      over = 0.0;
      isExtra = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                width: 400,
                height: 50,
                child: const Card(
                  color: Colors.black54,
                  child: Center(
                    child: Text(
                      'SCORE BOARD',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              ScoreBoard(score, wicket, over),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    SpecialButton(showNoBall, 'NB', wicket),
                    SpecialButton(showWide, 'WD', wicket),
                    SpecialButton(addWicket, 'W', wicket),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    RunButton(addRuns, 0, wicket),
                    RunButton(addRuns, 1, wicket),
                    RunButton(addRuns, 2, wicket),
                    RunButton(addRuns, 3, wicket),
                    RunButton(addRuns, 4, wicket),
                    RunButton(addRuns, 5, wicket),
                    RunButton(addRuns, 6, wicket),
                  ],
                ),
              ),
              wicket < 10
                  ? const Text('')
                  : TextButton(
                      onPressed: reset,
                      child: const Text(
                        'Reset',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
              isExtra == false ? const Text('') : ShowExtra(path),
            ],
          ),
        ),
      ),
    );
  }
}
