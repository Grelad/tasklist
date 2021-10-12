import 'package:flutter/material.dart';

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        title: Text(
          "Task list",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text("Main screen", style: TextStyle(
            color: Colors.white
          ),),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  '/todo'
                );
              },
              child: Text("Next", style: TextStyle(
                color: Colors.white
              ),)
          )
        ],
      )
    );
  }
}
