// ignore_for_file: library_private_types_in_public_api, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:flutter_application_1/myHomePage.dart';

// ignore: use_key_in_widget_constructors
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      // ignore: prefer_const_constructors
      appBar: AppBar(title: Text('Home')),
      body: Body());
  }
}

// ignore: use_key_in_widget_constructors
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String name;
  // ignore: unnecessary_new
  TextEditingController controller = new TextEditingController();

  void click(){
    // ignore: unnecessary_this
    this.name = controller.text;
    Navigator.push(
      // ignore: prefer_const_constructors, unnecessary_this
      context, MaterialPageRoute(builder: (context) => MyHomePage(this.name)));
  }

  @override
  Widget build(BuildContext context){
    return Align(
      alignment: Alignment.center, 
      child: Padding(
        padding: const EdgeInsets.all(10), 
        child: TextField(
          // ignore: unnecessary_this
          controller: this.controller, 
          decoration: InputDecoration(
          // ignore: prefer_const_constructors
            prefixIcon: Icon(Icons.person), 
            labelText: "Type Your Name:", 
            // ignore: prefer_const_constructors
            border: OutlineInputBorder(
              // ignore: prefer_const_constructors
              borderSide: BorderSide(width: 5, color: Colors.black)),
            suffixIcon:IconButton(
              // ignore: prefer_const_constructors
              icon:Icon(Icons.done), 
              splashColor: Colors.lightBlue,
              tooltip:"Submit",
              // ignore: unnecessary_this
              onPressed: this.click, 
            )
          ),
        ),
      )
    );
  }
}


