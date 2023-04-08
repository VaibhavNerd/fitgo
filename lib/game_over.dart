import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:firebase_database/firebase_database.dart';

import 'game_page.dart';


class GameOver extends StatefulWidget {
  const GameOver({Key key}) : super(key: key);

  @override
  State<GameOver> createState() => _GameOverState();
}

class _GameOverState extends State<GameOver> {
  DatabaseReference ref2 = FirebaseDatabase.instance.ref('628713/calorie');
  int calorie;
  @override
  void initState() {
    getUserData();
    // TODO: implement initState
    super.initState();
  }
  Future getUserData() async {
    Stream<DatabaseEvent> stream = ref2.onValue;

// Subscribe to the stream!
    stream.listen((DatabaseEvent event) {
      // print('Event Type: ${event.type}'); // DatabaseEventType.value;
      // print('Snapshot: ${event.snapshot}'); // DataSnapshot
      calorie = event.snapshot.value;
      print("calorie");
      print(calorie);

    });

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "GameOver",
              style: TextStyle(
                fontSize: 28,
              ),
            ),
           // SizedBox(height: 5,),
            Text(
               "Calorie: 8",
              style: TextStyle(
                fontSize: 40,color: Colors.green, fontWeight: FontWeight.bold
              ),
            ),
            Center(
              child: MaterialButton(
                elevation: 30,
                color: Color(0xFF023E8A),
                shape: CircleBorder(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => GamePage(),

                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(100),
                  child: Text(
                    'RESTART',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
            ),
            Text("FitGO"),
          ],
        ),
      ),
    );
  }
}
