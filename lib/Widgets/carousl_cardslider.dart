import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/category model.dart';
import '../Models/product model.dart';
import '../Screens/Catalog/Catalog Screen.dart';

class CarasolCard extends StatelessWidget {
  final Category? category;
  final Product? product;
  const CarasolCard({Key? key,this.category,this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap: (){
         Navigator.pushNamed(context, '/catalogScreen',
         arguments: category
         );
       },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0,vertical: 20.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(
                    product == null?
                    category!.imageurl: product!.imageUrl, fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      product == null?
                       category!.name:'',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
