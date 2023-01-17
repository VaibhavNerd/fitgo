import 'package:flutter/material.dart';
import 'package:gofit/game_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "FitGo",
              style: TextStyle(
                fontSize: 28,
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
                    'START',
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
