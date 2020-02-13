import 'package:comsats_attock_test/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


void main() {
  return runApp(ComsatsApp());
}

class ComsatsApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _ComsatsAppState createState() => _ComsatsAppState();
}

class _ComsatsAppState extends State<ComsatsApp> {
  final List questionsList = [
    Question('This is true', true),
    Question('This is false', false),
    Question('This is true', true),
    Question('This is false', false),
    Question('This is true', true),
    Question('This is false', false),
    Question('This is true', true),
    Question('This is false', false),
  ];

  final correctIcon = Icon(
    Icons.clear,
    color: Colors.red,
  );

  final incorrectIcon = Icon(
    Icons.check,
    color: Colors.green,
  );

  int count = 0;

  List<Widget> iconsList = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black54,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 100, bottom: 100),
                child: Text(
                  questionsList[count].text,
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.green,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Text(
                        'TRUE',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onPressed: () {
//                      print('True pressed');
                      setState(() {
                        if (questionsList[count].answer == true)
                          iconsList.add(incorrectIcon);
                        else
                          iconsList.add(correctIcon);
                        count++;
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  RaisedButton(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child:
                      Text('FALSE', style: TextStyle(color: Colors.white)),
                    ),
                    onPressed: () {
                      setState(() {
                        if (questionsList[count].answer == false)
                        iconsList.add(incorrectIcon);
                        else
                        iconsList.add(correctIcon);
                        count++;
                      });
//                      print('False pressed');
                    },
                  ),
                  Row(
                    children: iconsList,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
