// ignore_for_file: prefer_const_constructors, unnecessary_this, unnecessary_new, use_key_in_widget_constructors, library_private_types_in_public_api, empty_constructor_bodies, prefer_const_literals_to_create_immutables, sort_child_properties_last

// ignore: unused_import, avoid_web_libraries_in_flutter
import'dart:html';
import 'package:flutter_application_1/login.dart';
import'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      home: LoginPage(),
    );
  }
}