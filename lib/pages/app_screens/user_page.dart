import 'package:dbstech_blocapi/pages/app_detail/app_details.dart';
import 'package:dbstech_blocapi/pages/app_detail/bloc/app_detail_bloc.dart';

import 'package:dbstech_blocapi/pages/app_screens/bloc/app_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_detail/cartModel.dart';
import 'bloc/app_bloc.dart';
import 'bloc/app_states.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int toggle = 2;
  var _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) => FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  _visible = !_visible;
                });

                context.read<UserBloc>().add(AddId(_visible ? 2 : 1));
              },
              label: const Text("Change Me"))),
      appBar: AppBar(
        title: const Text("Bloc Api"),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserLoadedState) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final data = state.users[index];
                return BlocBuilder<CartBloc, CartState>(
                  builder: (context, state2) {
                    return GestureDetector(
                      onTap: () {
                        //   List<String> cart = state2.cartItem;
                        //  BlocProvider.of<CartBloc>(context).add(AddProduct( data.firstName.toString() + data.lastName.toString()));
                        //  print(cart);
                      },
                      child: ListTile(
                          title: Text(data.firstName.toString() +
                              data.lastName.toString()),
                          leading: CircleAvatar(
                            child: Image.network(data.avatar.toString()),
                          ),
                          trailing: BlocBuilder<CartBloc, CartState>(
                            builder: (context, state2) {
                              return IconButton(
                                  onPressed: () {
                                     BlocProvider.of<CartBloc>(context)
                                            .add(CartAddItemEvent(
                                              product: Product(name:data.firstName.toString() )
                                                ));

                                                final cartBloc =BlocProvider.of<CartBloc>(context, listen: false);
                                                print(cartBloc.cart.products.map((e) {
                                                  return {
                                                     "name":e.name
                                                  };
                                                 }).toList());
                                   

                                    // !state2.
                                    //         .contains(data.firstName.toString())
                                    //     ?
                                    //     : BlocProvider.of<CartBloc>(context)
                                    //         .add(CartRemoveItemEvent(
                                    //              product: Product(name:data.firstName.toString() )));
                                  },
                                  icon:  Icon(Icons.favorite));
                            },
                          )),
                    );
                  },
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
