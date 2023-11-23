import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/bloc/card_shop_bloc.dart';
import 'package:shopping_cart/model/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.all(8),
        elevation: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      product.thumbnail!,
                      height: 70,
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      product.title!,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "\$ ${product.price}",
                      style: const TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ],
            ),
            const Spacer(),
            BlocBuilder<CardShopBloc, CardShopState>(
              builder: (context, state) {
                return Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        context
                            .read<CardShopBloc>()
                            .add(DecreaseTheCounter(product));
                      },
                    ),
                    Text(
                      "${product.count}",
                      style: const TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        context
                            .read<CardShopBloc>()
                            .add(IncreaseTheCounter(product));
                      },
                    ),
                  ],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: InkWell(
                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onTap: () {
                  context.read<CardShopBloc>().add(RemoveFromCart(product));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
