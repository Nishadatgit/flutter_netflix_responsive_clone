import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_responsive_ui_clone/components/my_scroll_behaviour.dart';
import 'package:netflix_responsive_ui_clone/cubit/appbar/app_bar_cubit.dart';
import 'package:netflix_responsive_ui_clone/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider( 
      create: (context) => AppBarCubit(),
      child: MaterialApp(
          scrollBehavior: MyCustomScrollBehavior(),
          title: 'Flutter Netflix Ui Clone',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              iconTheme: const IconThemeData(color: Colors.white),
              scaffoldBackgroundColor: Colors.black,
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity),
          home: const MainScreen()),
    );
  }
}
