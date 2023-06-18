

import 'package:flutter_bloc/flutter_bloc.dart';

import '../cartModel.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final Cart cart;

  CartBloc({required this.cart}) : super( CartInitialState()){
    // ignore: void_checks
    on<CartAddItemEvent>((event, emit) {
      cart.addItem(event.product);
      return CartUpdatedState(cart: cart);
    });

    // ignore: void_checks
    on<CartRemoveItemEvent>((event,emit){
   cart.removeItem(event.product);
      return CartUpdatedState(cart: cart);
    });
  }

  

  // Stream<CartState> mapEventToState(CartEvent event) async* {
  //   if (event is CartAddItemEvent) {
  //     cart.addItem(event.product);
  //     yield CartUpdatedState(cart: cart);
  //   } else if (event is CartRemoveItemEvent) {
  //     cart.removeItem(event.product);
  //     yield CartUpdatedState(cart: cart);
  //   }
  // }
}

class CartEvent {}

class CartAddItemEvent extends CartEvent {
  final Product product;

  CartAddItemEvent({required this.product});
}

class CartRemoveItemEvent extends CartEvent {
  final Product product;

  CartRemoveItemEvent({required this.product});
}

class CartState {}

class CartInitialState extends CartState {}

class CartUpdatedState extends CartState {
  final Cart cart;

  CartUpdatedState({required this.cart});
}