class Product {
  Product(
      {required this.title,
      required this.price,
      required this.thumbnail,
      required this.count});

  String? title;
  int? price;
  String? thumbnail;
  int? count;

  Product.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
    thumbnail = json['thumbnail'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['price'] = price;
    data['thumbnail'] = thumbnail;
    data['count'] = count;

    return data;
  }
}
