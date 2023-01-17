import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:firebase_database/firebase_database.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
 // DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");
   DatabaseReference ref = FirebaseDatabase.instance.ref('628710');
  double x, y, z;
  double last = 0.0,
      second = 0.0,
      third = 0.0,
      fourth = 0.0,
      fifth = 0.0,
      sixth = 0.0,
      var1=1,
      var2=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      setState(() {
        x = event.x;
        y = event.y;
        z = event.z;
      });
    }); //get the sensor data and set then to the data types
  }

  Future<void> realtimeUpdateAction(int action) async {
  await  ref
           .update({'actions': '$action'});
      //  .update({'actions': '$action${DateTime.now().millisecondsSinceEpoch}'});
  }

  Future<void> createData() async {
    // await ref.set({
    //   "name": "John",
    //   "age": 18,
    //   "address": {
    //     "line1": "100 Mountain View"
    //   }
    // });
    // await ref.set({
    //   'actions': '${0}${DateTime.now().millisecondsSinceEpoch}',
    //   'code': 628710,
    // });

  //   await ref.set({
  //     'actions': '${0}',
  //     'code': 628710,
  //   });
  // }
   await ref.set({
   'actions': '${-1}',
   'code': 628710,
   });
}

  @override
  Widget build(BuildContext context) {
    sixth = fifth;
    fifth = fourth;
    fourth = third;
    third = second;
    second = last;
    last = z;

    //Jump
    if (y > 2) {
      print("Jumped");
      print("${y}\n");
      realtimeUpdateAction(0);
    }

   // Left
    if (third < 0) {
      if (last > (sixth * 2)) {
        print("left");
        realtimeUpdateAction(1);
      }
    }
   //  if (z > 1.5) {
   //
   //      print("left");
   //      realtimeUpdateAction(1);
   //
   //  }

    // if (x>0) {
    //   if (x>0.5) {
    //     print("right");
    //     realtimeUpdateAction(2);
    //   }
    // }

   // Right
   //  if (var1>var2) {
   //
   //      print("${z}\n");
   //     // realtimeUpdateAction(2);
   //
   //  }
    if (fifth > (sixth * 1.3)) {
      if (fourth < 0.5 || third < 0.5 || second < 0.5 || last < 0.5) {
        print("--->right");
        realtimeUpdateAction(-1);
      }
    }
   //  if (z > -0.05) {
   //
   //    print("right${z}");
   //    realtimeUpdateAction(2);
   //
   //  }

    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Sensor Library"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Position",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900),
                ),
              ),
              Table(
                border: TableBorder.all(
                    width: 2.0,
                    color: Colors.blueAccent,
                    style: BorderStyle.solid),
                children: [
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "X Asis : ",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            x.toStringAsFixed(
                                2), //trim the asis value to 2 digit after decimal point
                            style: TextStyle(fontSize: 20.0)),
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Y Asis : ",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            y.toStringAsFixed(
                                2), //trim the asis value to 2 digit after decimal point
                            style: TextStyle(fontSize: 20.0)),
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Z Asis : ",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            z.toStringAsFixed(
                                2), //trim the asis value to 2 digit after decimal point
                            style: TextStyle(fontSize: 20.0)),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              FlatButton(
                height: 100,
                minWidth: 300,
                color: Colors.red,
                onPressed: () {
                 // var1 = -1;
                   createData();
                 // realtimeUpdateAction(0);
                  print("stop");
                },
                child: Text("Flag"),
              ),
              FlatButton(
                height: 100,
                minWidth: 300,
                color: Colors.blue,
                onPressed: () {
                  var1 = 1;
                  //createData();
                  // realtimeUpdateAction(0);
                  print("start");
                },
                child: Text("Flag"),
              ),
            ],
          ),
        ));
  }
}
