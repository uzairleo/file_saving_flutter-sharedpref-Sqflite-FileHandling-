import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:saving_file_locally/sharedPreferences.dart';

double cradius = 12.0;
var hund = '0';
var ten = '1';
var zero = '1';
var textPad=45.0;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _callback() async {
    // print('started: ${DateTime.now()}');
    setState(() {
      cradius = 48.0;
      hund = '1';
      ten = '0';
      zero = '1';
      // textPad=60;
    });
    try {
      final ms = Random().nextInt(5000);
      await Future.delayed(Duration(milliseconds: ms));
    } finally {
      // print('finished: ${DateTime.now()}');
      setState(() {
        cradius = 12.0;
        hund = '0';
        ten = '1';
        zero = '2';
        // textPad=45;
      });
      Timer(Duration(seconds: 3), _callback);
    }
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 4), (c) {
      _callback();
    });
    Future.delayed(
        Duration(
          seconds: 20,
        ), () {
          
      _screenNavigator();
    });
  }

  _screenNavigator() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => (MyApps())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.brown,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 110.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _customContainer(hund, 'HUND'),
                    _customContainer(ten, 'TEN'),
                    _customContainer(zero, 'ZERO'),
                  ],
                ),
              ),
              AnimatedContainer(
                height: 130.0,
                duration:Duration(seconds:2),
                child: Padding(
                  padding: EdgeInsets.only(top: 33),
                  child: RichText(
                      text: TextSpan(
                          text: "Tally",
                          style: TextStyle(
                              fontSize: textPad,
                              fontFamily: 'Satisfy',
                              color: Colors.amber),
                          children: [
                        TextSpan(
                          text: ' Counter',
                          style: TextStyle(
                              fontSize: textPad,
                              fontFamily: 'Satisfy',
                              color: Colors.amber),
                        ),
                      ])),
                ),
              ),
              //  CircularProgressIndicator(
              //    backgroundColor: Colors.white,
              //  ),
              Padding(
                padding: const EdgeInsets.only(top: 155.0),
                child: Text(
                  '\t\t\t\t\t\t\tVersion 1.0 \n @uzairleo/Software',
                  style: TextStyle(
                    fontSize: 16,
                    // color: Colors.white54
                  ),
                ),
              )
            ],
          )),
    );
  }

  Widget _customContainer(var digitValue, var digitTitle) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 8.0, left: 6.0, right: 6.0, bottom: 9.0),
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        width: 100,
        height: 130,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 31, 33, 35),
          boxShadow: [
            BoxShadow(
                color: Colors.black54, blurRadius: 8.0, offset: Offset(-4, 6))
          ],
          borderRadius: BorderRadius.circular(cradius),
          // border: Border.all(color: Colors.white70,width: 1.5)
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  digitValue,
                  style: TextStyle(
                      fontSize: 84.0,
                      color: Colors.white70,
                      fontFamily: 'digital-7'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  digitTitle,
                  style: TextStyle(fontSize: 20.0, color: Colors.white70),
                ),
              ),
            ]),
      ),
    );
  }
}
