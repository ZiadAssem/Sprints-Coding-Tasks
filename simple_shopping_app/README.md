# Basic Shopping Interface

This Flutter app displays a list of products using key widgets like `GridView.builder`, `ListView.builder`, `PageView.builder`, and `Expanded` to create a responsive and dynamic interface.

## Key Widgets Used:

### 1. `PageView.builder`
- Creates a horizontally scrollable carousel for product images.

```dart
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
```

### 2. `GridView.builder`
- Displays products in a grid, each row has 2 products.
- Each product is shown as a card containing details like name, price, and description.

```dart
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
```

### 3. `ListView.builder`
- Creates a horizontal list for hot offers.
- Each list item is a card containing the product's image and a short description.

```dart
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

```

### 4. `Expanded`
- Ensures that child widgets inside a flex container take up space proportionally.

```dart
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
```

---

## Project Structure

- **ProductsPage**: The main screen containing all the sections such as the product carousel, catalog, and hot offers list.
- **SectionTitle**: A widget to display section titles in the UI.
- **ProductCarousel**: Displays a horizontally scrollable carousel of product images.
- **ProductGrid**: Displays a 2-column grid of product items.
- **HotOffersList**: Displays a horizontally scrollable list of hot offers.
- **ProductItem**: A widget for displaying individual products in the grid.
- **HotOfferCard**: A widget for displaying each product in the hot offers list.

---
