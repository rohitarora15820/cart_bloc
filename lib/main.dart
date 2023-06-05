import 'package:dbstech_blocapi/bloc/app_bloc.dart';
import 'package:dbstech_blocapi/bloc/app_event.dart';
import 'package:dbstech_blocapi/pages/user_page.dart';
import 'package:dbstech_blocapi/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

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
      )
    ], child: const UserPage())
      ),
    );
  }
}

