import 'package:flutter/material.dart';
import 'package:intro_views_flutter/UI/page.dart';
import 'package:listanimation/page.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'dart:async';
import 'package:intro_views_flutter/intro_views_flutter.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> imglist = [
    "https://src.img.photos/2019/09/07/a70AAf.md.jpg",
    "https://images.unsplash.com/photo-1542662565-7e4b66bae529?ixlib=rb-1.2.1&auto=format&fit=crop&w=428&h=214&q=60",
    "https://images.unsplash.com/reserve/unsplash_524010c76b52a_1.JPG?ixlib=rb-1.2.1&w=1000&q=80",
    "https://src.img.photos/2019/09/07/a70AAf.md.jpg",
    "https://images.unsplash.com/photo-1542662565-7e4b66bae529?ixlib=rb-1.2.1&auto=format&fit=crop&w=428&h=214&q=60",
    "https://images.unsplash.com/reserve/unsplash_524010c76b52a_1.JPG?ixlib=rb-1.2.1&w=1000&q=80"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyList'),
      ),
      body: ListView.builder(itemCount: imglist.length, itemBuilder: (context, index) {
        return StickyHeader(
          header: Container(
            height: 50.0,
            color: Colors.blueGrey[700],
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: Text(
              'Header $index',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          content: Container(
            child: Image.network(
              imglist[index],
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200.0,
            ),
          ),
          
        );
      }),
      floatingActionButton: FloatingActionButton(
      onPressed:(){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyPage()));
      },
      child: Icon(Icons.arrow_drop_up),
      ),
    );
  }
}
