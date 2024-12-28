import 'package:flutter/material.dart';
import 'package:simple_shopping_app/product_model.dart';

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

class ProductGrid extends StatelessWidget {
  final List<ProductModel> products;
  const ProductGrid({required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItem(product: products[index]);
        },
      ),
    );
  }
}

class HotOffersList extends StatelessWidget {
  final List<ProductModel> products;
  const HotOffersList({required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return HotOfferCard(product: products[index]);
        },
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final ProductModel product;
  const ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              product.name,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            Text(
              '${product.price}',
              style: const TextStyle(fontSize: 14, color: Colors.green),
            ),
            Text(
              product.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${product.name} added to cart')),
                );
              },
              icon: const Icon(Icons.shopping_cart_checkout),
              label: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}

class HotOfferCard extends StatelessWidget {
  final ProductModel product;
  const HotOfferCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(right: 16),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product.description,
                        style: const TextStyle(
                            fontSize: 14, color: Colors.grey),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
