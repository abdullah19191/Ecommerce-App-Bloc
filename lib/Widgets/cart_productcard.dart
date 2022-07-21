import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Models/product model.dart';
import '../block/cartblock/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  const CartProductCard({Key? key, required this.product,required this.quantity}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            height: 80,
            width: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text('\$${product.price}'),
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Row(
            children: [
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is CartLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is CartLoaded) {
                    return IconButton(
                        onPressed: () {
                          context.read<CartBloc>()
                            ..add(CartProductRemoved(product));
                        },
                        icon: Icon(Icons.remove_circle));
                  } else {
                    return Text('something went wrong');
                  }
                },
              ),
              Text(
                '$quantity',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is CartLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is CartLoaded) {
                    return IconButton(
                        onPressed: () {
                          context.read<CartBloc>()
                            ..add(CartProductAdded(product));
                        },
                        icon: Icon(Icons.add_circle));
                  } else {
                    return Text('something went wrong');
                  }
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

// BlocBuilder<CartBloc, CartState>(
// builder: (context, state) {
// if(state is CartLoading){
// return Center(child: CircularProgressIndicator(),);
// }
