import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  String title;
  CustomAppBar({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Container(color: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Text(title,style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w600),),),
      iconTheme: IconThemeData(color: Colors.black),
      actions: [IconButton(onPressed: (){
        Navigator.pushNamed(context, '/wishlist');
      },icon:Icon(Icons.favorite))],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0);
}
