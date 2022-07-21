import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable{
  String name;
  String category;
  double price;
  String imageUrl;
  bool isRecommended;
  bool isPopular;
  Product({required this.category,required this.isRecommended,required this.isPopular,required this.price,required this.imageUrl,required this.name});
  @override
  List<Object?> get props => [name,imageUrl,isPopular,isPopular,price,category];

  static Product GetSnapshot(DocumentSnapshot snap){
    Product product = Product(category: snap['category'], isRecommended: snap['isRecommended'],
        isPopular: snap['isPopular'], price: snap['price'], imageUrl: snap['imageUrl'], name: snap['name']);
    return product;
  }
  static List<Product> products = [
    Product(category: 'Soft Drink', isRecommended: true, isPopular:  false, price: 2.99,  imageUrl: 'https://wallpaperaccess.com/full/3410620.jpg', name:'Soft Drink #1'),
    Product(category: 'Soft Drink', isRecommended: false,isPopular:  true,  price: 2.99,  imageUrl: 'https://i.pinimg.com/originals/4a/9d/f4/4a9df4f44ee622c7f78dcfd187d663c6.jpg', name:'Soft Drink #2'),
    Product(category: 'Soft Drink', isRecommended: true, isPopular:  true,  price: 2.99,  imageUrl: 'https://wallpapercave.com/wp/wc1674202.jpg', name:'Soft Drink #3'),
    Product(category: 'Smoothies',  isRecommended: true, isPopular:  false, price: 2.99,  imageUrl: 'https://www.dinneratthezoo.com/wp-content/uploads/2018/01/raspberry-smoothie-3.jpg', name:'Smoothies #1'),
    Product(category: 'Smoothies',  isRecommended: false,isPopular:  true,  price: 2.99,  imageUrl: 'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/kale-smoothie-b96d533.jpg', name:'Smoothies #2'),
  ];
}