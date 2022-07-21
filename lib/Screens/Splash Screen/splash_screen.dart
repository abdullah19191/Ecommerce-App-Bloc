import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Models/category model.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String routeName= '/SpalshScreen';
  static Route route(){
    return MaterialPageRoute(
        settings: RouteSettings(name:routeName,),
        builder: (_)=>SplashScreen());
  }
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2),() => Navigator.pushNamed(context, '/'));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('images/wolf.png',width: 125,height: 125,),
          ),
          SizedBox(height: 10,),
          Container(
            color: Colors.black,
           padding: EdgeInsets.all(8.5),
              child: Text('Zero To Leopard',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );
  }
}
