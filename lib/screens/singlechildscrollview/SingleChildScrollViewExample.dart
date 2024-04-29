import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/Post.dart';

/// Flutter code sample for [SingleChildScrollView].

class SingleChildScrollViewExample extends StatefulWidget {
  static String routeName = "/singlechildscrollview";

  const SingleChildScrollViewExample({super.key});

  @override
  State<SingleChildScrollViewExample> createState() => _SingleChildScrollViewExampleState();
}

// homepage state
class _SingleChildScrollViewExampleState extends State<SingleChildScrollViewExample> {
  List<Widget> getRandomWidgetArray(){

    List <Widget> gameCells = <Widget>[];
    for(int i=0;i<15;i++)
    {
      Container c = Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child:
        ElevatedButton(
          child: const Text("ListView", style: TextStyle(fontSize: 25)),
          onPressed: (){
            showDialog(context: context, builder: (context) => AlertDialog(
              title: const Text("Alert Dialog"),
              content: const Text("ListView on Press"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
              ),
              actions: [
                TextButton(onPressed: () {
                  Navigator.pop(context);
                }, child: const Text("Close"))
              ],
            ));
          },
        ),
      );
      gameCells.add(c);
    }
    return gameCells;
  }
  // build function
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Posts", style: TextStyle(color: Colors.white)),
            actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
            color: Colors.white,
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Next page',
                          style: TextStyle(color: Colors.white)),
                    ),
                    body: const Center(
                      child: Text(
                        'This is the next page',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  );
                },
              ));
            },
            color: Colors.white,
          )
        ]
        ),
        body: SingleChildScrollView(
          child: Column(
            children: getRandomWidgetArray(),
          ),
        )
    );
  }
}
