import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soft_bd_task/provider/softbd_task_provider.dart';
import 'package:soft_bd_task/view/chose_interest_page.dart';
import 'package:soft_bd_task/view/home_page.dart';
import 'package:soft_bd_task/view/movie_details_page.dart';
import 'package:soft_bd_task/view/sign_up.dart';

import 'view/all_movies_page.dart';

void main() {

  runApp(ChangeNotifierProvider(create: (context) => SoftbdTaskProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        SignUpPage.routeName:(context) => const SignUpPage(),
        HomePage.routeName:(context) => const HomePage(),
        AllMoviesPage.routeName:(context) => AllMoviesPage(),
        ChoseInterestPage.routeName:(context) => ChoseInterestPage(),
        MovieDetailsPage.routeName:(context) => MovieDetailsPage(),
      },
    );
  }
}

