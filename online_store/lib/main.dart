
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_store/pages/main_page.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(create:(context)=> ProductProvider(),
    return MaterialApp(
      home: MainPage(),
    );
  }
}