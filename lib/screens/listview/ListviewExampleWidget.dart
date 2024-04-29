import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../models/Post.dart';



// homepage class
class ListViewExampleWidget extends StatefulWidget {
  static String routeName = "/listview";
  const ListViewExampleWidget({super.key});

  @override
  State<ListViewExampleWidget> createState() => _MyHomePageState();
}

// homepage state
class _MyHomePageState extends State<ListViewExampleWidget> {
  // variable to call and store future list of posts
  Future<List<Post>> postsFuture = getPosts();

  // function to fetch data from api and return future list of posts
  static Future<List<Post>> getPosts() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/albums/1/photos");
    final response =
    await http.get(url, headers: {"Content-Type": "application/json"});
    final List body = json.decode(response.body);
    return body.map((e) => Post.fromJson(e)).toList();
  }

  // build function
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Posts", style: TextStyle(color: Colors.white))),
      body: Center(
        // FutureBuilder
        child: FutureBuilder<List<Post>>(
          future: postsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // until data is fetched, show loader
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              // once data is fetched, display it on screen (call buildPosts())
              final posts = snapshot.data!;
              return buildPosts(posts);
            } else {
              // if no data, show simple Text
              return const Text("No data available");
            }
          },
        ),
      ),
    );
  }

  // function to display fetched data on screen
  Widget buildPosts(List<Post> posts) {
    // ListView Builder to show data in a list
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return Container(
          color: Colors.grey.shade300,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          height: 100,
          width: double.maxFinite,
          child: InkWell(
            onTap: () {
              // on tap, show a snackbar with post title
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(post.title!),
              ));
            },
            child: Row(
              children: [
                Expanded(flex: 1, child: Image.network(post.url!)),
                const SizedBox(width: 10),
                Expanded(flex: 3, child: Text(post.title!)),
              ],
            ),
          ),
        );
      },
    );
  }
}
