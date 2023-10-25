// ignore_for_file: file_names, unnecessary_this, use_key_in_widget_constructors, library_private_types_in_public_api

import'package:flutter/material.dart';
import'post.dart';
import'postList.dart';
import'textInputWidget.dart';

class MyHomePage extends StatefulWidget {
  final String name;

 // ignore: prefer_const_constructors_in_immutables
 MyHomePage(this.name);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts =[];

  void newPost(String text) {
    this.setState(() {
      // ignore: unnecessary_new
      posts.add(new Post(text, widget.name));
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      // ignore: prefer_const_constructors
      appBar: AppBar(title: Text('Message')),
      body: Column(children: <Widget>[
        Expanded(child: PostList(this.posts)),
        TextInputWidget(this.newPost)
        ]));
  }
}