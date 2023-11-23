import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/bloc/card_shop_bloc.dart';
import 'package:shopping_cart/bloc_theme/theme_bloc_bloc.dart';
import 'package:shopping_cart/data/globals.dart';
import 'package:shopping_cart/screens/add_screen.dart';
import 'package:shopping_cart/widgets/product_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeBlocBloc>().add(ChangThemEvent('Light'));
            },
            icon: Icon(Icons.sunny),
          ),
          IconButton(
            onPressed: () {
              context.read<ThemeBlocBloc>().add(ChangThemEvent('dark'));
            },
            icon: Icon(Icons.monochrome_photos),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddProductScreen()));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      //--------------- body ---------------
      body: SafeArea(
        child: BlocBuilder<CardShopBloc, CardShopState>(
          builder: (context, state) {
            return Column(children: [
              BlocBuilder<CardShopBloc, CardShopState>(
                builder: (context, state) {
                  return ListView(
                    shrinkWrap: true,
                    children: [
                      for (var element in listProductsObjects)
                        ProductCard(product: element)
                    ],
                  );
                },
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Total Price : ",
                    style: TextStyle(fontSize: 25),
                  ),
                  BlocBuilder<CardShopBloc, CardShopState>(
                    builder: (context, state) {
                      return Text(
                        "\$ ${getTotal()}",
                        style:
                            const TextStyle(fontSize: 25, color: Colors.blue),
                      );
                    },
                  )
                ],
              ),
              const SizedBox(height: 32),
            ]);
          },
        ),
      ),
    );
  }
}
