import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kisiler_bloc_dio/Views/Anasayfa.dart';
import 'package:flutter_kisiler_bloc_dio/cubit/AnasayfaCubit.dart';
import 'package:flutter_kisiler_bloc_dio/cubit/DetayCubit.dart';
import 'package:flutter_kisiler_bloc_dio/cubit/KayitCubit.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => KayitCubit()),
        BlocProvider(create: (context) => DetayCubit()),
        BlocProvider(create: (context) => AnasayfaCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true,
        ),
        home: const Anasayfa(),
      ),
    );
  }
}

