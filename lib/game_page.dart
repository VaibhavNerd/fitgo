import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gofit/game_over.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:firebase_database/firebase_database.dart';


class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
 // DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");
   DatabaseReference ref = FirebaseDatabase.instance.ref('628713');
   DatabaseReference ref2 = FirebaseDatabase.instance.ref('628713/over');
   var goJump = true;
  double  x =0, y=0, z=0;
   List<double> values = List<double>.filled(6,0) ;
  double last = 0.0,
      second = 0.0,
      third = 0.0,
      fourth = 0.0,
      fifth = 0.0,
      sixth = 0.0,
      var1=1,
      var2=0;
      int? over;
  @override
  void initState() {
    getUserData();
    // TODO: implement initState
    super.initState();
    ref.set({
      'actions': '${3}',
      'code': 628714,
      'over': 0,
      'calorie': 1,
    });

    userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      if(mounted) {
        setState(() {
          x = event.x;
          y = event.y;
          z = event.z;
        });
      }
    }); //get the sensor data and set then to the data types
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
   Future getUserData() async {
     Stream<DatabaseEvent> stream = ref2.onValue;

// Subscribe to the stream!
     stream.listen((DatabaseEvent event) {
       // print('Event Type: ${event.type}'); // DatabaseEventType.value;
       // print('Snapshot: ${event.snapshot}'); // DataSnapshot
        over = event.snapshot.value as int?;
       print(over);
        if(over==1){
          setState(() {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => GameOver()));
          });

        }
     });

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
   'actions': '${3}',
   'code': 628714,
    'over': 0,
     'calorie': 0,
   });
}

  @override
  Widget build(BuildContext context) {
    // values[5] = z;
    // values[1]=
  // third = second;
    sixth = fifth;
    fifth = fourth;
    fourth = third;
    third = second;
    second = last;
    last = z;

   // Jump
    if (y > 3 ) {
    //  print("Jumped");
      print("jumped${y}\n");
      realtimeUpdateAction(0);
      const oneSec = Duration(milliseconds:1400);
      Timer.periodic(oneSec, (Timer t) {
        realtimeUpdateAction(2);
        y = 0;
        z = 0;

      });
     // Timer( Duration(milliseconds: 500), () {  realtimeUpdateAction(2); });
    }
   //
   // // Left
   //  if (third < 0) {
   //    if (last > (sixth * 2)) {
   //      print("left");
   //      realtimeUpdateAction(1);
   //    }
   //  }
   // //  if (z > 1.5) {
   // //
   // //      print("left");
   // //      realtimeUpdateAction(1);
   // //
   // //  }
   //
   //  // if (x>0) {
   //  //   if (x>0.5) {
   //  //     print("right");
   //  //     realtimeUpdateAction(2);
   //  //   }
   //  // }
   //
   // Right
    if (var1>var2) {

      //  print("${z}\nsecond:${second}\nthird:${third}\nfourth: ${fourth}\nfifth: ${fifth}\nsixth: ${sixth}\nlast: ${last}\n");
        print("${z}\n");
       // realtimeUpdateAction(2);

    }
   //  if (fifth > (sixth * 1.3)) {
   //    if (fourth < 0.5 || third < 0.5 || second < 0.5 || last < 0.5) {
   //      print("--->right");
   //      realtimeUpdateAction(-1);
   //    }
   //  }
   //  if (z > -0.05) {
   //
   //    print("right${z}");
   //    realtimeUpdateAction(2);
   //
   //  }

    // //Left
    //   if (third < 0) {
    //     if (last > (second * 2) && last > 0.5 ) {
    //       print("left");
    //       realtimeUpdateAction(1);
    //     }
    //   }
    // //  Right
    //   if (fifth > (sixth * 1.3)) {
    //     if (fourth < -0.5 || third < -0.5 || second < -0.5 || last < -0.5) {
    //       print("right");
    //       realtimeUpdateAction(2);
    //     }
    //   }
    //  if (second > last && third > last  && last <= -2.1 && (second).abs() <=0.5 ) {
    //   // if (fourth < 0.5 || third < 0.5 || second < 0.5 || last < 0.5) {
    //     print("${second}\n${last}");
    //      print("right");
    //    //  second=z=last=third=0;
    //      realtimeUpdateAction(1);
    //     Timer( Duration(milliseconds: 400), () {  realtimeUpdateAction(2); });
    //
    //
    //
    //  }
    // if (second < last && third < last  && last >= 2.1 && (second).abs() <=0.5 ) {
    //   // if (fourth < 0.5 || third < 0.5 || second < 0.5 || last < 0.5) {
    //   print("${second}\n${last}");
    //   print("left");
    //  // second=z=last=third=0;
    //   realtimeUpdateAction(-1);
    //   Timer( Duration(milliseconds: 400), () {  realtimeUpdateAction(2); });
    //
    // }
    if (last<0 && second>0 && second >=1 && last<= -0.7) {
      // if (fourth < 0.5 || third < 0.5 || second < 0.5 || last < 0.5) {
      print("${second}\n${last}");
      print("left");
      // second=z=last=third=0;
      realtimeUpdateAction(1);
      Timer( Duration(milliseconds: 400), () {  realtimeUpdateAction(2); });

    }
    if (last>0 && second<0 && second <=-1 && last >= 0.7 ) {
      // if (fourth < 0.5 || third < 0.5 || second < 0.5 || last < 0.5) {
      print("${second}\n${last}");
      print("right");
       //second=z=last=third=0;
      realtimeUpdateAction(-1);
      Timer( Duration(milliseconds: 400), () {  realtimeUpdateAction(2); });

     }
    // if(over==1){
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => GameOver()));
    //   });
    //
    // }



      // setState(() {
      //   // Here you can write your code for open new view
      // });


    // if (y > 4 && goJump == true ) {
    //   print("Jumped");
    //
    //   print(y);
    //   y = 0;
    //   print(y);
    //   Timer( Duration(milliseconds: 300), () {  print("delayed"); goJump = true;});
    //   goJump = false;
    //   print(goJump);
    //   realtimeUpdateAction(0);
    //
    //
    //
    //   realtimeUpdateAction(3);
    // }



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
                          "Z Axis : ",
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: Size(160, 60),
                 // fixedSize: Size.fromWidth(100),
                  padding: EdgeInsets.all(10),
                ),
                onPressed: () {
                  var1 = -1;
                   createData();
                 // realtimeUpdateAction(0);
                  print("stop");
                },
                child: Text("Stop"),
              ),
              SizedBox( height: 40,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                 minimumSize: Size(160, 60),
                // minimumSize: Size.fromHeight(160),
                 // fixedSize: Size.fromWidth(100),
                  padding: EdgeInsets.all(10),
                ),
                onPressed: () {
                  var1 = 1;
                  //createData();
                  // realtimeUpdateAction(0);
                  print("start");
                },
                child: Text("Start"),
              ),
            ],
          ),
        ));
  }
}
