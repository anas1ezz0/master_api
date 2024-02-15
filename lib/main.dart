import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterapi/cubit/my_cubit.dart';
import 'package:masterapi/di/injection.dart';
import 'package:masterapi/home.dart';

void main() {
  initGetIt();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => getIt<MyCubit>(),
        child: const Home(),
      ),
    );
  }
}
