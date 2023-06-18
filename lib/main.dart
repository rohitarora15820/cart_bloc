import 'package:dbstech_blocapi/pages/app_detail/bloc/app_detail_bloc.dart';
import 'package:dbstech_blocapi/pages/app_detail/bloc/app_detail_event.dart';
import 'package:dbstech_blocapi/pages/app_detail/bloc/app_detail_state.dart';
import 'package:dbstech_blocapi/pages/app_detail/cartModel.dart';
import 'package:dbstech_blocapi/pages/app_screens/bloc/app_bloc.dart';
import 'package:dbstech_blocapi/pages/app_screens/bloc/app_event.dart';
import 'package:dbstech_blocapi/pages/app_screens/user_page.dart';
import 'package:dbstech_blocapi/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//         brightness: Brightness.dark,
//       ),
//       routes: {
//         HomePage.routeName: (context) => HomePage(),
//         //CartPage.routeName: (context) => CartPage(),
//       },
//       initialRoute: HomePage.routeName,
//       //home: MyBookings(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserRepository(),
      child: MaterialApp(
          title: 'Bloc App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) =>
                  UserBloc(RepositoryProvider.of<UserRepository>(context))
                    ..add(const AddId(2)),
            ),
            BlocProvider(create: (context) => CartBloc(cart: Cart())),
          ], child: const UserPage())),
    );
  }
}


// class HomePage extends StatefulWidget {
//   static String routeName = '/';

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   double _crossAxisSpacing = 8, _mainAxisSpacing = 12, _aspectRatio = 5;

//   int _crossAxisCount = 1;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;

//     var width = (screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
//         _crossAxisCount;
//     var height = width / _aspectRatio;

//     return BlocProvider(
//         create: (_) => CartBloc(),
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text('Shopping App'),
//             actions: <Widget>[
//               Stack(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(right: 16),
//                     child: TextButton.icon(
//                       style: TextButton.styleFrom(primary: Colors.white),
//                       onPressed: () {
//                         //Navigator.pushNamed(context, CartPage.routeName);
//                       },
//                       icon: Icon(Icons.shopping_cart),
//                       label: Text(''),
//                       key: Key('cart'),
//                     ),
//                   ),
//                   BlocBuilder<CartBloc, CartState>(builder: (_, cartState) {
//                     List<int> cartItem = cartState.cartItem;
//                     return Positioned(
//                       left: 30,
//                       child: Container(
//                         padding: EdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Colors.red),
//                         child: Text(
//                           '${cartItem.length}',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     );
//                   }),
//                 ],
//               ),
//             ],
//           ),
//           body: ProductList(),
//         ));
//   }
// }

// class ProductList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CartBloc, CartState>(builder: (_, cartState) {
//       List<int> cart = cartState.cartItem;

//       return LayoutBuilder(builder: (context, constraints) {
//         return GridView.builder(
//           itemCount: 100,
//           itemBuilder: (context, index) {
//             final Color color = Colors.primaries[index % Colors.primaries.length];
//             return ListTile(
                      
//         onTap: () {
//           // Navigator.pushNamed(
//           //   context,
//           //   ProductPage.routeName,
//           //   arguments: Product('Product $itemNo', color),
//           // );
//         },
//         leading: Container(
//           width: 50,
//           height: 30,
//           child: Placeholder(
//             color: color,
//           ),
//         ),
//         title: Text(
//           'Product $cart',
//           key: Key('text_$index'),
//         ),
//         trailing: IconButton(
//           key: Key('icon_$index'),
//           icon: cart.contains(index)
//               ? Icon(Icons.shopping_cart)
//               : Icon(Icons.shopping_cart_outlined),
//           onPressed: () {
//             !cart.contains(index)
//                 ? BlocProvider.of<CartBloc>(context).add(AddProduct(index))
//                 : BlocProvider.of<CartBloc>(context).add(RemoveProduct(index));
//           },
//         ),
//       );
//           },
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: constraints.maxWidth > 700 ? 4 : 1,
//             childAspectRatio: 5,
//           ),
//         );
//       });
//     });
//   }
// }


