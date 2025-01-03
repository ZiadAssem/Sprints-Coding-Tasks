import 'package:flutter/material.dart';
import 'package:signup_page/products/view/widgets/carousel.dart';
import 'package:signup_page/products/view/widgets/grid.dart';
import 'package:signup_page/products/view/widgets/list.dart';
import 'package:signup_page/products/models/product_model.dart';


class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

List<ProductModel> products = [
  ProductModel(
      name: 'iPhone',
      price: 50000,
      description: 'A brand new iPhone 16',
      image: 'assets/images/iphone16.jpg'),
  ProductModel(
      name: 'MacBook',
      price: 60000,
      description: 'A brand new MacBook',
      image: 'assets/images/macbook.jpeg'),
  ProductModel(
      name: 'PS5',
      price: 30000,
      description: 'The latest PS5 Pro',
      image: 'assets/images/ps5.jpeg'),
  ProductModel(
      name: 'Laptop',
      price: 40000,
      description: 'A new Lenovo laptop with Core i7 processor',
      image: 'assets/images/lenovo.jpeg'),
  ProductModel(
      name: 'Phone',
      price: 35000,
      description: 'A new Google Pixel phone',
      image: 'assets/images/google.jpeg')
];

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sprints Products' , style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SectionTitle(title: 'OUR PRODUCTS'),
              const SizedBox(height: 16),
              ProductCarousel(products: products),
              const SizedBox(height: 24),
              const SectionTitle(title: 'Product Catalog'),
              const SizedBox(height: 16),
              ProductGrid(products: products),
              const SizedBox(height: 24),
              const SectionTitle(title: 'Hot Offers'),
              const SizedBox(height: 16),
              HotOffersList(products: products),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}






