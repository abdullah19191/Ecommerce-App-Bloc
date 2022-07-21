
import 'package:flutter/cupertino.dart';

import '../Models/product model.dart';
import 'product_card.dart';

class ProductCarousl extends StatelessWidget {
  final  List<Product> product;
  const ProductCarousl({
    Key? key,required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: 165,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection:  Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            itemCount: product.length,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: ProductCard(product: product[index],),
              );
            }),
      ),
    );
  }
}
