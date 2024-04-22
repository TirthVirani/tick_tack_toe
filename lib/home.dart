import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tick_tack_toe/main.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IS(),
    );
  }
}

class IS extends StatefulWidget {
  const IS({Key? key}) : super(key: key);

  @override
  State<IS> createState() => _ISState();
}

class _ISState extends State<IS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("asset/images/tk1.jpg"), fit: BoxFit.cover)),
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'TICK TACK TOE',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TickTckToe()));
                    },
                    child: Text(
                      'PLAY GAME',
                      style: TextStyle(
                        fontSize: 35,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
