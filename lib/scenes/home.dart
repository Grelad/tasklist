import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late String _userTask;
  List taskList = [];

  // void initFirabase() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   await Firebase.initializeApp();
  // }

  @override
  void initState() {
    super.initState();

    // initFirabase();

    taskList.addAll([
      'Finish course',
      'Create architecture',
      'Поцiлувати Аньку',
    ]);
  }

  void _menuOpen() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.white, //change your color here
              ),
            title: Text("Menu")),
            body: Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/',
                          (route) => false
                      );
                    },
                    child: Text("Main Menu", style: TextStyle(
                      color: Colors.white,
                    ),),
                ),
                Padding(padding: EdgeInsets.only(left:5),),
                Text("Simple menu")
              ],
            )
          );
      })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text(
            "Task list",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: _menuOpen,
                icon: Icon(Icons.menu))
          ],
        ),
        body: ListView.builder(
            itemCount: taskList.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: Key(taskList[index]),
                child: Card(
                  child: ListTile(
                    title: Text(taskList[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete_rounded),
                      color: Colors.deepPurple,
                      onPressed: () {
                        setState(() {
                          taskList.removeAt(index);
                        });
                      },
                    ),
                  ),
                ),
                onDismissed: (direction) {
                  // if(direction == DismissDirection.endToStart)
                  setState(() {
                    taskList.removeAt(index);
                  });
                },
              );
            }),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow,
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Add task'),
                    content: TextField(
                      onChanged: (String value) {
                        _userTask = value;
                      },
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            FirebaseFirestore.instance.collection('items').add({
                              'item': _userTask
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text("Add", style: TextStyle(
                            color: Colors.white
                          ),))
                    ],
                  );
                }
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.black
          ),
        ),

    );
  }
}
