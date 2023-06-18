// import 'package:equatable/equatable.dart';

// import '../cartModel.dart';

// abstract class CartState  extends Equatable{
//   final List<Cart> cartItem;
//   const CartState({required this.cartItem});

//   @override
//   List<Object> get props => [];
// }



// class ProductAdded extends CartState {
//   final List<Cart> cartItem;

//   const ProductAdded({required this.cartItem}) : super(cartItem: cartItem);

//   @override
//   List<Object> get props => [cartItem];

//   @override
//   String toString() => 'ProductAdded { todos: $cartItem }';
// }

// class ProductRemoved extends CartState {
//   final List<Cart> cartItem;

//   const ProductRemoved({required this.cartItem}) : super(cartItem: cartItem);

//   @override
//   List<Object> get props => [cartItem];

//   @override
//   String toString() => 'ProductRemoved { todos: $cartItem }';
// }