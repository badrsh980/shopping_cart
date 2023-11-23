part of 'card_shop_bloc.dart';

@immutable
sealed class CardShopState {}

final class CardShopInitial extends CardShopState {}

class UpdateCart extends CardShopState {}
