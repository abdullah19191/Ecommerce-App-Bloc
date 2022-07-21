import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable{
  final String name;
  final String imageurl;

  Category({required this.name,required this.imageurl});

  @override
  List<Object?> get props =>[name,imageurl];

  static Category GetSnapshots(DocumentSnapshot snap){
    Category category = Category(name: snap['name'],imageurl: snap['imageUrl']);
    return category;
  }

  static  List<Category> categories = [
    Category(name: 'Soft Drink', imageurl: 'https://previews.123rf.com/images/monticello/monticello1804/monticello180400220/103002397-poznan-poland-apr-6-2018-bottles-of-global-soft-drink-brands-including-products-of-coca-cola-company.jpg'),
    Category(name: 'Smoothies', imageurl: 'https://www.evolvingtable.com/wp-content/uploads/2021/05/5-Frozen-Fruit-Smoothies-copy.jpg'),
    Category(name: 'Water', imageurl: 'https://domf5oio6qrcr.cloudfront.net/medialibrary/7909/b8a1309a-ba53-48c7-bca3-9c36aab2338a.jpg')
  ];

}