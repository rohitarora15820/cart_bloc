
// // import 'package:dbstech_blocapi/pages/app_detail/bloc/app_detail_bloc.dart';
// // import 'package:dbstech_blocapi/pages/app_detail/bloc/app_detail_state.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';

// // class AppDetails extends StatefulWidget {
// //   const AppDetails({super.key});

// //   @override
// //   State<AppDetails> createState() => _AppDetailsState();
// // }

// // class _AppDetailsState extends State<AppDetails> {


// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Save State in Table"),
// //       ),
// //       body: ProductList(),
// //       // body: SingleChildScrollView(
// //       //   child: Column(
// //       //     children: [
// //       //       // Center(
// //       //       //   child: SingleChildScrollView(
// //       //       //       scrollDirection: Axis.horizontal,
// //       //       //       child: BlocBuilder<CartBloc, CartState>(
// //       //       //         builder: (context, state) {
// //       //       //           return DataTable(
// //       //       //             showBottomBorder: true,
// //       //       //             columnSpacing: 50,
// //       //       //             rows: [
// //       //       //               ...List.generate(
// //       //       //                   state.cartItem.length,
// //       //       //                   (index) => DataRow(cells: [
// //       //       //                         DataCell(
// //       //       //                             Text(state.cartItem[index].toString()))
// //       //       //                       ]))
// //       //       //             ],
// //       //       //             columns: [
// //       //       //               DataColumn(
// //       //       //                 label: Text("Item 1"),
// //       //       //               ),
                         
// //       //       //             ],
// //       //       //           );
// //       //       //         },
// //       //       //       )),
// //       //       // ),
// //       //       Padding(
// //       //           padding: const EdgeInsets.symmetric(horizontal: 80),
// //       //           child: Container(
// //       //             decoration: BoxDecoration(
// //       //                 color: Colors.orange,
// //       //                 borderRadius: BorderRadius.circular(40)),
// //       //             child: IconButton(
// //       //                 // color: Colors.orange,
// //       //                 icon: const Icon(
// //       //                   Icons.add,
// //       //                   size: 30,
// //       //                   color: Colors.white,
// //       //                 ),
// //       //                 onPressed: () {
// //       //                   Navigator.of(context).push(CupertinoDialogRoute(
// //       //                     context: context,
// //       //                     builder: (context) => AppDetailDialog(),
// //       //                   ));
// //       //                 }),
// //       //           )),
// //       //     ],
// //       //   ),
// //       // ),
// //     );
// //   }
// // }

// // class ProductList extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocBuilder<CartBloc, CartState>(builder: (_, cartState) {
// //       List<String> cart = cartState.cartItem;

// //       return LayoutBuilder(builder: (context, constraints) {
// //         return GridView.builder(
// //           itemCount: 100,
// //           itemBuilder: (context, index) {
// //             final Color color = Colors.primaries[index % Colors.primaries.length];
// //             return ListTile(
                      
// //         onTap: () {
     
// //         },
// //         leading: Container(
// //           width: 50,
// //           height: 30,
// //           child: Placeholder(
// //             color: color,
// //           ),
// //         ),
// //         title: Text(
// //           'Product $cart',
// //           key: Key('text_$index'),
// //         ),
      
// //       );
// //           },
// //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //             crossAxisCount: constraints.maxWidth > 700 ? 4 : 1,
// //             childAspectRatio: 5,
// //           ),
// //         );
// //       });
// //     });
// //   }
// // }




// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'bloc/app_detail_bloc.dart';
// import 'cartModel.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
// Widget build(BuildContext context) {
//   final cartBloc = context.read<CartBloc>();

//   return BlocProvider.value(
//     value: cartBloc,
//     child: Scaffold(
//       appBar: AppBar(
//         title: const Text('Shopping List'),
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         itemCount: products.length,
//         itemBuilder: (context, index) {
//           final product = products[index];
//           return ShoppingListItem(product: product);
//         },
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Container(
//           padding: const EdgeInsets.all(16.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('${cartBloc.state.cart.itemCount} items'),
//               Text('Total: \$${cartBloc.state.cart.getTotal()}'),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
// }

// class ShoppingListItem extends StatelessWidget {
//   ShoppingListItem({required this.product});

//   final Product product;

//   @override
//   Widget build(BuildContext context) {
//     final cartBloc = context.watch<CartBloc>();

//     final inCart = cartBloc.state.cart.products.contains(product);

//     return ListTile(
//       onTap: () {
//         final event = inCart
//             ? CartRemoveItemEvent(product: product)
//             : CartAddItemEvent(product: product);
//         cartBloc.add(event);
//       },
//       leading: CircleAvatar(
//         backgroundColor: inCart ? Colors.black38 : Colors.blue,
//         child: Text(product.name[0]),
//       ),
//       title: Text(product.name),
//     );
//   }
// }