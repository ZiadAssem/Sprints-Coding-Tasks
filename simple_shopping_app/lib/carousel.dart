import 'package:flutter/material.dart';
import 'package:simple_shopping_app/product_model.dart';

class ProductCarousel extends StatelessWidget {
  final List<ProductModel> products;
  const ProductCarousel({required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: PageView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              products[index].image,
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }
}