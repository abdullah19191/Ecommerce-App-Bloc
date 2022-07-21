import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SectionTile extends StatelessWidget {
  String title;

  SectionTile({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Align(
          alignment: Alignment.topLeft,
          child: Text( title,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w700),)),
    );
  }
}
