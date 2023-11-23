import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/bloc/card_shop_bloc.dart';
import 'package:shopping_cart/model/product.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({super.key});
  final TextEditingController titleController = TextEditingController(),
      priceController = TextEditingController(),
      countController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Product")),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(hintText: "title"),
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(hintText: "price"),
              controller: priceController,
            ),
            TextField(
              decoration: const InputDecoration(hintText: "count"),
              controller: countController,
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
                onPressed: () {
                  // Retrieve values from text controllers
                  final String title = titleController.text;
                  final int price = int.tryParse(priceController.text) ?? 0;
                  final int count = int.tryParse(countController.text) ?? 0;
                  final Product newProduct = Product(
                      title: title,
                      price: price,
                      count: count,
                      thumbnail:
                          'https://cdn.icon-icons.com/icons2/1678/PNG/512/wondicon-ui-free-parcel_111208.png');
                  BlocProvider.of<CardShopBloc>(context)
                      .add(AddToCart(newProduct));
                  Navigator.pop(context);
                },
                child: const Text("Add To Cart"))
          ],
        ),
      ),
    );
  }
}
