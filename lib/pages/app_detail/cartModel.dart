class Product {
  const Product({required this.name});

  final String name;
}

class Cart {
  final List<Product> _products = [];

  List<Product> get products => List.unmodifiable(_products);

  int get itemCount => _products.length;

  void addItem(Product product) {
    _products.add(product);
  }

  void removeItem(Product product) {
    _products.remove(product);
  }

  int getTotal() {
    return _products.length+1; // a placeholder method to calculate total
  }
}