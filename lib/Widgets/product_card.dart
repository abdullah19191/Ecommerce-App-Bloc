import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Models/product model.dart';
import '../Screens/Product/Product Screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../block/cartblock/cart_bloc.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double width;
  final double leftposition;
  final bool isWishlist;

  const ProductCard({
    Key? key,
    required this.product,
    this.width = 2.5,
    this.isWishlist = false,
    this.leftposition = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/productScreen', arguments: product);
      },
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / width,
            height: 150,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 60,
            left: leftposition,
            child: Container(
              width: MediaQuery.of(context).size.width / leftposition - 1.5,
              height: 80,
              decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
            ),
          ),
          Positioned(
            top: 65,
            left: leftposition + 5,
            child: Container(
              width: MediaQuery.of(context).size.width / 2.5 + leftposition,
              height: 70,
              decoration: BoxDecoration(color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '\$ ${Product.products[0].price.toString()}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        if(state is CartLoading){
                          return Center(child: CircularProgressIndicator(),);
                        }
                        if(state is CartLoaded){
                          return Expanded(
                            child: IconButton(
                              icon: Icon(
                                Icons.add_circle,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                context.read<CartBloc>().add(CartProductAdded(product));
                              },
                            ),
                          );
                        }else{
                          return Text('Something Went Wrong');
                        }
                      },
                    ),
                    isWishlist
                        ? Expanded(
                            child: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          )
                        : SizedBox()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
