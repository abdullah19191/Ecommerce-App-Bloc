import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Models/product model.dart';
import '../Screens/Cart/Cart Screen.dart';
import '../Screens/Product/Product Screen.dart';
import '../main.dart';


class CustomNavBar extends StatelessWidget {
  String screen;
  CustomNavBar({Key? key, required this.screen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  MyApp()),
              );
            },icon: Icon(Icons.home,color: Colors.white,)),
            IconButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
              },icon: Icon(Icons.shopping_cart,color: Colors.white,)),
            IconButton(onPressed: (){
             Navigator.pushNamed(context, screen);
            },icon: Icon(Icons.person,color: Colors.white,))
          ],
        ),
      ),
    );
  }
}
