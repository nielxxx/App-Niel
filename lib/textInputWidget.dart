// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

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
    widget.callback(controller.text);
    FocusScope.of(context).unfocus();
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return
      TextField(
        // ignore: unnecessary_this
        controller: this.controller,
        decoration: InputDecoration(
            // ignore: prefer_const_constructors
            prefixIcon: Icon(Icons.message), labelText: "Type a message:", 
            suffixIcon:IconButton(
              // ignore: prefer_const_constructors
              icon:Icon(Icons.send), 
              splashColor: Colors.lightBlue,
              tooltip:"Post message",
              // ignore: unnecessary_this
              onPressed: this.click, 
            )));  
  }
}