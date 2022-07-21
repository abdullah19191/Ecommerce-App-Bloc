
import 'package:ecommerce_app_block/Screens/Checkout/checkout_screen.dart';
import 'package:ecommerce_app_block/Screens/Splash%20Screen/splash_screen.dart';
import 'package:ecommerce_app_block/block/checkout/checkout_bloc.dart';
import 'package:ecommerce_app_block/block/productsbloc/product_bloc.dart';
import 'package:ecommerce_app_block/repositories/category/category_repository.dart';
import 'package:ecommerce_app_block/repositories/checkout/checkout_repository.dart';
import 'package:ecommerce_app_block/repositories/product/product_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Screens/Home Screen.dart';
import 'Widgets/custom_navbar.dart';
import 'Widgets/custom_app_bar.dart';
import 'block/cartblock/cart_bloc.dart';
import 'block/category/category_bloc.dart';
import 'block/wishlistbloc/wishlist_bloc.dart';
import 'config/app_routing.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async{
WidgetsFlutterBinding.ensureInitialized();
await  Firebase.initializeApp();
BlocOverrides.runZoned(
      () {
    runApp(MyApp());
  },
  // blocObserver: SimpleBlocObserver(),
);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>WishlistBloc()..add(StartWishlist()),),
        BlocProvider(create: (_)=>CartBloc()..add(CartStarted()),),
        BlocProvider(create: (_)=>CategoryBloc(categoryRepository: CategoryRepository())..add(LoadCategories())),
        BlocProvider(create: (_)=>ProductBloc( productRepository: ProductRepository())..add(LoadProduct())),
        BlocProvider(create: (context)=> CheckoutBloc(checkoutRepository: Checkoutrepository(),cartBloc: context.read<CartBloc>())) ,
      ],
      child: MaterialApp(
        title: 'Zero To Unicorn',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: AppRouter.onGeneratedRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}




