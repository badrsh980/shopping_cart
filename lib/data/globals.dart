import 'package:shopping_cart/data/product_data.dart';
import 'package:shopping_cart/model/product.dart';

List<Product> listProductsObjects = [];
getProductObjects() {
  for (var element in productsData) {
    listProductsObjects.add(Product.fromJson(element));
  }
}

int getTotal() {
  int total = 0;

  for (var Product in listProductsObjects) {
    total += (Product.price! * Product.count!);
  }

  return total;
}
