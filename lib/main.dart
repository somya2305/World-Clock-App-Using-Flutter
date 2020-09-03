import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/Choose Location.dart';
import 'pages/Loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context){
        return Loading();
      },
      '/home':(context){
        return Home();
      },
      '/location':(context){
        return ChooseLocation();
      },
    },
  ));
}


