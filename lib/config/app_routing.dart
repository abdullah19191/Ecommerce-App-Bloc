import 'package:ecommerce_app_block/Screens/Splash%20Screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Models/category model.dart';
import '../Models/product model.dart';
import '../Screens/Cart/Cart Screen.dart';
import '../Screens/Catalog/Catalog Screen.dart';
import '../Screens/Checkout/checkout_screen.dart';
import '../Screens/Home Screen.dart';
import '../Screens/Product/Product Screen.dart';
import '../Screens/wishlist/WishList Screen.dart';

class AppRouter {
  static Route onGeneratedRoute(RouteSettings settings){
    print('This is Route${settings.name}');

    switch (settings.name){
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case WishListScreen.routeName:
        return WishListScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute(){
    return MaterialPageRoute(
        settings: RouteSettings(name: '/error'),
        builder: (_) => Scaffold(appBar: AppBar(title: Text('Error'),)
        )
    );
  }
}