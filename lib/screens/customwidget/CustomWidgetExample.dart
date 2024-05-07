import 'package:flutter/material.dart';
import 'component/header_with_seachbox.dart';
import 'component/title_with_more_bbtn.dart';



class CustomWidgetExample extends StatefulWidget {
  static String routeName = "/customwidget";

  const CustomWidgetExample({super.key});

  @override
  State<CustomWidgetExample> createState() => _CustomWidgetExampleState();
}

// homepage state
class _CustomWidgetExampleState extends State<CustomWidgetExample> {

  // build function
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              HeaderWithSearchBox(size: size),
              TitleWithMoreBtn(title: "Recomended", press: () {}),
            ]
          ),
        )
    );
  }
}
