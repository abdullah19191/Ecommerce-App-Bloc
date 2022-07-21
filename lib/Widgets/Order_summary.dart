import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../block/cartblock/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
  builder: (context, state) {
    if(state is CartLoaded){
    return Column(
      children: [
        Divider(
          thickness: 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SUBTOTAL',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1,
                  ),
                  Text(
                    '\$${state.cart.SubtotalString}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'DELIVERY FEE',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1,
                  ),
                  Text(
                    '\$${state.cart.deliverFeeString}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        Stack(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            color: Colors.grey,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(5),
            height: 50,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'TOTAL FEE',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Colors.white),
                  ),
                  Text(
                    '\$${state.cart.TotalString}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          )
        ])
      ],
    );
    }else{
      return Text('Something Went Wrong');
    }
  },
);
  }
}
