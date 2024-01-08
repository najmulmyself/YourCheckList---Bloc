import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/TodoPage.dart';
import 'package:todo/cubit/todos_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(750, 1334),
      child: BlocProvider(
        create: (context) => TodosCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Your CheckList',
          home: TodoPage(),
        ),
      ),
    );
  }
}
