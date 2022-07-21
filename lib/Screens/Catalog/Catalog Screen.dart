import 'package:flutter/material.dart';
import '../../Models/category model.dart';
import '../../Models/product model.dart';
import '../../Widgets/custom_app_bar.dart';
import '../../Widgets/custom_navbar.dart';
import '../../Widgets/product_card.dart';


class CatalogScreen extends StatelessWidget {
  final Category category;
   CatalogScreen({Key? key,required this.category}) : super(key: key);
  static const String routeName= '/catalogScreen';
  static Route route({required Category category}){
    return MaterialPageRoute(
        settings: RouteSettings(name:routeName,),
        builder: (_)=>CatalogScreen(category: category));
  }
  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products.where((product) => product.category == category.name).toList();
    return Scaffold(
        appBar: CustomAppBar(title: category.name),
        bottomNavigationBar: CustomNavBar(screen: '/catalogScreen'),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,crossAxisSpacing: 1.15,),
        itemCount: categoryProducts.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(child:
          ProductCard(
              width: 2.2,
              product: categoryProducts[index]
          ));
      },
      ),
      );
  }
}
