// ignore_for_file: prefer_const_constructors, unnecessary_this, unnecessary_new, use_key_in_widget_constructors, library_private_types_in_public_api, empty_constructor_bodies, prefer_const_literals_to_create_immutables, sort_child_properties_last

// ignore: unused_import
import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Post {
  String body;
  String author;
  int likes=0;
  bool userLiked= false;

  Post (this.body, this.author);

  void likePost(){
    this.userLiked = !this.userLiked;
    if(this.userLiked){
      this.likes += 1;
    }
    else {
      this.likes -= 1;
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Niel App',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: false,
      ),
      home: const MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State <MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<Post> posts =[];

  void newPost(String text) {
    this.setState(() {
      posts.add(new Post(text, "Niel"));
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Messaging')),
      body: Column(children: <Widget>[
        Expanded(child: PostList(this.posts)),
        TextInputWidget(this.newPost)
        ]));
  }
}


class TextInputWidget extends StatefulWidget {
  final Function(String) callback;

  const TextInputWidget(this.callback, {super.key});

  @override

  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    controller.dispose();
  }

  void click(){
    FocusScope.of(context).unfocus();
    controller.clear();
    widget.callback(controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return
      TextField(
        controller: this.controller,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.message), labelText: "Type a message:", 
            suffixIcon:IconButton(
              icon:Icon(Icons.send), 
              splashColor: Colors.lightBlue,
              tooltip:"Post message",
              onPressed: this.click, 
            )));  
  }
}

class PostList extends StatefulWidget {
  final List<Post> listItems;

  PostList(this.listItems);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  void like(Function callback) {
    this.setState((){
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
  return ListView.builder(
    itemCount: this.widget.listItems.length,
    itemBuilder: (context, index){
      var post = this.widget.listItems[index];
      return Card(
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListTile(
              title: Text(post.body), 
              subtitle: Text(post.author),
            )), 
          Row(
            children: <Widget>[
              // ignore: avoid_unnecessary_containers
              Container(
                child: 
                  Text(post.likes.toString(), style: TextStyle(fontSize: 20)),
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                ),
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () => this.like(post.likePost),
                color: post.userLiked ? Colors.lightBlue : Colors.black
              )
            ],
          )
        ]));
      },
    );
  }
}