part of 'card_shop_bloc.dart';

@immutable
sealed class CardShopEvent {
  final Product product;

  CardShopEvent(this.product);
}

class IncreaseTheCounter extends CardShopEvent {
  IncreaseTheCounter(super.product);
}

class DecreaseTheCounter extends CardShopEvent {
  DecreaseTheCounter(super.product);
}

class AddToCart extends CardShopEvent {
  AddToCart(super.product);
}

class RemoveFromCart extends CardShopEvent {
  RemoveFromCart(super.product);
}
