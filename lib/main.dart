import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app_ui/controller/shoeprovider.dart';
import 'package:shoe_app_ui/screens/shoegrid.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ShoeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoe Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  ShoeGrid(),
     
    );
  }
}
