// ignore_for_file: file_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, library_private_types_in_public_api, unnecessary_this, sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import'post.dart';

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