import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_cart/data/globals.dart';
import 'package:shopping_cart/model/product.dart';

part 'card_shop_event.dart';
part 'card_shop_state.dart';

class CardShopBloc extends Bloc<CardShopEvent, CardShopState> {
  CardShopBloc() : super(CardShopInitial()) {
    on<AddToCart>((event, emit) {
      listProductsObjects.add(event.product);
      emit(UpdateCart());
    });

    on<RemoveFromCart>((event, emit) {
      listProductsObjects.remove(event.product);
      emit(UpdateCart());
    });

    on<IncreaseTheCounter>((event, emit) {
      event.product.count = event.product.count! + 1;
      emit(UpdateCart());
    });

    on<DecreaseTheCounter>((event, emit) {
      if (event.product.count! > 1) {
        event.product.count = event.product.count! - 1;
      } else {
        listProductsObjects.remove(event.product);
      }
      emit(UpdateCart());
    });
  }
}
