import 'package:ecommerce_app_block/Models/product%20model.dart';
import 'package:ecommerce_app_block/Widgets/Order_summary.dart';
import 'package:flutter/material.dart';

import '../../Models/cart_model.dart';
import '../../Widgets/cart_productcard.dart';
import '../../Widgets/custom_app_bar.dart';
import '../../Widgets/custom_navbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../block/cartblock/cart_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(
          name: routeName,
        ),
        builder: (_) => CartScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Cart'),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {
                    Navigator.pushNamed(context, '/CheckoutScreen');
                  },
                  child: Text(
                    'GO TO CHECKOUT',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state){
            if (state is CartLoading)
              return Center(
                child: CircularProgressIndicator(),
              );
            if (state is CartLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Cart().FeeDeliveryString,
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/');
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.black,
                                        shape: RoundedRectangleBorder(),
                                        elevation: 0),
                                    child: Text(
                                      'Add More Items',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(color: Colors.white),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 300,
                              child: ListView.builder(
                                  itemCount: state.cart.productQuantity(state.cart.products).keys.length,
                                  itemBuilder: (context, index) {
                                    return CartProductCard(
                                      product: state.cart.productQuantity(state.cart.products).keys.elementAt(index),
                                      quantity: state.cart.productQuantity(state.cart.products).values.elementAt(index),
                                    );
                                  }),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            OrderSummary(),
                          ],
                        )
                      ]),
                ),
              );
            }else{
              return Text('Something went wrong');
            }
          },
        ));
  }
}



// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
// child: SingleChildScrollView(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Column(
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(
// Cart().FeeDeliveryString,
// style: Theme.of(context).textTheme.bodyText2,
// ),
// ElevatedButton(
// onPressed: () {
// Navigator.pushNamed(context, '/');
// },
// style: ElevatedButton.styleFrom(
// primary: Colors.black,
// shape: RoundedRectangleBorder(),
// elevation: 0),
// child: Text(
// 'Add More Items',
// style: Theme.of(context)
// .textTheme
//     .bodySmall!
// .copyWith(color: Colors.white),
// ))
// ],
// ),
// SizedBox(
// height: 300,
// child: ListView.builder(
// itemCount: Cart().products.length,
// itemBuilder: (context, index) {
// return CartProductCard(
// product: Cart().products[index],
// );
// }),
// ),
// ],
// ),
// Column(
// children: [
// Divider(
// thickness: 2,
// ),
// Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 20, vertical: 10.0),
// child: Column(
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(
// 'SUBTOTAL',
// style: Theme.of(context).textTheme.bodyText1,
// ),
// Text(
// '\$${Cart().SubtotalString}',
// style: Theme.of(context).textTheme.bodyText1,
// ),
// ],
// ),
// SizedBox(
// height: 10,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(
// 'DELIVERY FEE',
// style: Theme.of(context).textTheme.bodyText1,
// ),
// Text(
// '\$${Cart().deliverFeeString}',
// style: Theme.of(context).textTheme.bodyText1,
// ),
// ],
// ),
// SizedBox(
// height: 10,
// ),
// ],
// ),
// ),
// Stack(children: [
// Container(
// width: MediaQuery.of(context).size.width,
// height: 60,
// color: Colors.grey,
// ),
// Container(
// width: MediaQuery.of(context).size.width,
// margin: EdgeInsets.all(5),
// height: 50,
// color: Colors.black,
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(
// 'TOTAL FEE',
// style: Theme.of(context)
// .textTheme
//     .bodyText1
//     ?.copyWith(color: Colors.white),
// ),
// Text(
// '\$${Cart().TotalString}',
// style: Theme.of(context)
// .textTheme
//     .bodyText1!
// .copyWith(color: Colors.white),
// ),
// ],
// ),
// ),
// )
// ])
// ],
// )
// ]),
// ),
// )
