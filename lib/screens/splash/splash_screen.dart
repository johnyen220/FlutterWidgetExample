import 'package:flutter/material.dart';
import 'package:flutter_widget_example/screens/listview/ListviewExampleWidget.dart';
import 'package:flutter_widget_example/screens/appbar/AppBarApp.dart';
import 'package:flutter_widget_example/screens/singlechildscrollview/SingleChildScrollViewExample.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child:
                ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ListViewExampleWidget()),
                  );
                },
                child: const Text("ListView", style: TextStyle(fontSize: 25)),
              ),
            ),
            Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child:
              ElevatedButton(
                onPressed: () {
                  showDialog(context: context, builder: (context) => AlertDialog(
                    title: const Text("Alert Dialog"),
                    content: const Text("Hello World"),
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
                child: const Text("Show Alert", style: TextStyle(fontSize: 25)),
              ),
            ),
            Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child:
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AppBarExample()),
                  );
                },
                child: const Text("App Bar", style: TextStyle(fontSize: 25)),
              ),
            ),

            Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child:
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SingleChildScrollViewExample()),
                  );
                },
                child: const Text("Single Scroll View", style: TextStyle(fontSize: 25)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
