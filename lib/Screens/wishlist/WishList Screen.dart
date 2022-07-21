
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Widgets/custom_app_bar.dart';
import '../../Widgets/custom_navbar.dart';
import '../../Widgets/product_card.dart';
import '../../block/wishlistbloc/wishlist_bloc.dart';


class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);
  static const String routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName,),
        builder: (_) => WishListScreen());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'WishList'),
      bottomNavigationBar: CustomNavBar(screen: '/wishlist' ,),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state){
          if(state is WishlistLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }if(state is WishlistLoaded){
              return GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2.2,
                ),
                itemCount: state.wishlist.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(child:
                  ProductCard(
                    width: 1.1,
                    product: state.wishlist.products[index],
                    leftposition: 82,
                    isWishlist: true,
                  ));
                },
              );
            }
          else {
            return Text('Something went wrong');
          }
          }
      ),
    );
  }
}
