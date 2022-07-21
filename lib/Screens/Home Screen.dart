import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Models/category model.dart';
import '../Models/product model.dart';
import '../Widgets/carousl_cardslider.dart';
import '../Widgets/custom_app_bar.dart';
import '../Widgets/custom_navbar.dart';
import '../Widgets/product_card.dart';
import '../Widgets/product_carousl.dart';
import '../Widgets/section_title.dart';
import '../block/category/category_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../block/productsbloc/product_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(
          name: routeName,
        ),
        builder: (_) => HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Zero TO Unicorn'),
      bottomNavigationBar: CustomNavBar(
        screen: '/',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return CircularProgressIndicator();
                }
                if (state is CategoryLoaded) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 1.5,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      //enableInfiniteScroll: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                    ),
                    items: state.categories
                        .map((category) => CarasolCard(category: category))
                        .toList(),
                  );
                } else {
                  return Text('Something Went Wrong');
                }
              },
            )),
            SectionTile(title: 'RECOMMENDED'),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return CircularProgressIndicator();
                }
                if(state is ProductLoaded){
                  return ProductCarousl(
                      product: state.products
                          .where((product) => product.isRecommended)
                          .toList());
                }else{
                  return Text('Something Went Wrong');
                }
              },
            ),
            SectionTile(title: 'MOST POPULAR'),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return CircularProgressIndicator();
                }
                if(state is ProductLoaded){
                  return ProductCarousl(
                      product: state.products
                          .where((product) => product.isPopular)
                          .toList());
                }else{
                  return Text('Something Went Wrong');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
