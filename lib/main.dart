import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TickTckToe(),
    );
  }
}

class TickTckToe extends StatefulWidget {
  const TickTckToe({Key? key}) : super(key: key);

  @override
  State<TickTckToe> createState() => _TickTckToeState();
}

class _TickTckToeState extends State<TickTckToe> {
  bool ohTurn = true;
  List<String> displayEx0h = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  var myTextStyle =
      TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w600);
  int ohScore = 0;
  int exScore = 0;
  int filledBoxes = 0;

  static var myNewFont = GoogleFonts.lato(
      textStyle: TextStyle(color: Colors.black, letterSpacing: 3));
  static var myNewFontWhite = GoogleFonts.lato(
      textStyle:
          TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 25));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(
          'TICKTACKTOE',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("asset/images/tk1.jpg"), fit: BoxFit.cover)),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Player 0',
                            style: myNewFontWhite,
                          ),
                          Text(
                            ohScore.toString(),
                            style: myNewFontWhite,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Player X',
                            style: myNewFontWhite,
                          ),
                          Text(
                            exScore.toString(),
                            style: myNewFontWhite,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Expanded(
                flex: 3,
                child: GridView.builder(
                    itemCount: 9,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          _tapped(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          child: Center(
                            child: Text(
                              displayEx0h[index],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Expanded(
              child: Container(
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        '',
                        style: myNewFontWhite,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        '@CREATEDBYTK',
                        style: myNewFontWhite,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (ohTurn && displayEx0h[index] == '') {
        displayEx0h[index] = '0';
        filledBoxes += 1;
      } else if (!ohTurn && displayEx0h[index] == '') {
        displayEx0h[index] = 'x';
        filledBoxes += 1;
      }

      ohTurn = !ohTurn;
      _checkwin();
    });
  }

  void _checkwin() {
    if (displayEx0h[0] == displayEx0h[1] &&
        displayEx0h[0] == displayEx0h[2] &&
        displayEx0h[0] != '') {
      _showwin(displayEx0h[0]);
    }
    if (displayEx0h[3] == displayEx0h[4] &&
        displayEx0h[3] == displayEx0h[5] &&
        displayEx0h[3] != '') {
      _showwin(displayEx0h[3]);
    }
    if (displayEx0h[6] == displayEx0h[7] &&
        displayEx0h[6] == displayEx0h[8] &&
        displayEx0h[6] != '') {
      _showwin(displayEx0h[6]);
    }
    if (displayEx0h[0] == displayEx0h[3] &&
        displayEx0h[0] == displayEx0h[6] &&
        displayEx0h[0] != '') {
      _showwin(displayEx0h[0]);
    }
    if (displayEx0h[1] == displayEx0h[4] &&
        displayEx0h[1] == displayEx0h[7] &&
        displayEx0h[1] != '') {
      _showwin(displayEx0h[1]);
    }
    if (displayEx0h[2] == displayEx0h[5] &&
        displayEx0h[2] == displayEx0h[8] &&
        displayEx0h[2] != '') {
      _showwin(displayEx0h[2]);
    }
    if (displayEx0h[6] == displayEx0h[4] &&
        displayEx0h[6] == displayEx0h[2] &&
        displayEx0h[6] != '') {
      _showwin(displayEx0h[6]);
    }
    if (displayEx0h[0] == displayEx0h[4] &&
        displayEx0h[0] == displayEx0h[8] &&
        displayEx0h[0] != '') {
      _showwin(displayEx0h[0]);
    } else if (filledBoxes == 9) {
      _showdraw();
    }
  }

  void _showdraw() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Draw'),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    _clear();
                    Navigator.of(context).pop();
                  },
                  child: Text('PlayAgain'))
            ],
          );
        });
  }

  void _showwin(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('WINNER IS: ' + winner),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    _clear();
                    Navigator.of(context).pop();
                  },
                  child: Text('PlayAgain'))
            ],
          );
        });
    if (winner == '0') {
      ohScore += 1;
    } else if (winner == 'x') {
      exScore += 1;
    }
    _clear();
  }

  void _clear() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayEx0h[i] = '';
      }
    });

    filledBoxes = 0;
  }
}
