import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/TodoPage.dart';
import 'package:todo/cubit/todos_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodosCubit(),
      child: MaterialApp(
        title: 'Your App Title',
        home: TodoPage(),
      ),
    );
  }
}
