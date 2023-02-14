import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basics/providers/movie_provider.dart';
import 'package:provider_basics/screens/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => MovieProvider(),
      child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
